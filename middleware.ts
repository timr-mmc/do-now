import { NextResponse, type NextRequest } from 'next/server'
import { createServerClient } from '@supabase/ssr'
import { updateSession } from './src/utils/supabase/middleware'

// Routes where the "has any profiles?" DB check is not needed.
const SKIP_PROFILE_CHECK = ['/auth', '/login', '/signup', '/setup-class', '/api', '/shape-test']

// If the URL already contains a profileId segment, the user clearly has a
// profile — no need to hit the database.
const PROFILE_ID_IN_PATH = /\/(create-do-now|analytics|results|display)\/[^/]+/

export async function middleware(request: NextRequest) {
  // updateSession refreshes the auth cookie AND returns the current user,
  // eliminating the need for a second getUser() round-trip.
  const { response, user } = await updateSession(request)

  const { pathname } = request.nextUrl

  if (
    user &&
    !SKIP_PROFILE_CHECK.some(p => pathname.startsWith(p)) &&
    !PROFILE_ID_IN_PATH.test(pathname)
  ) {
    // Create a minimal client whose setAll writes back to the same response
    // object that updateSession already built — avoids the cookie-loss bug
    // caused by creating a second independent response.
    const supabase = createServerClient(
      process.env.NEXT_PUBLIC_SUPABASE_URL!,
      process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY!,
      {
        cookies: {
          getAll() {
            return request.cookies.getAll()
          },
          setAll(cookiesToSet) {
            cookiesToSet.forEach(({ name, value, options }) => {
              request.cookies.set(name, value)
              response.cookies.set(name, value, options)
            })
          },
        },
      }
    )

    const { data: profiles, error } = await supabase
      .from('profiles')
      .select('id')
      .eq('user_id', user.id)
      .limit(1)

    if (!error && (!profiles || profiles.length === 0)) {
      const url = request.nextUrl.clone()
      url.pathname = '/setup-class'
      return NextResponse.redirect(url)
    }
  }

  return response
}

export const config = {
  matcher: [
    /*
     * Match all request paths except for the ones starting with:
     * - _next/static (static files)
     * - _next/image (image optimization files)
     * - favicon.ico (favicon file)
     */
    '/((?!_next/static|_next/image|favicon.ico|.*\\.(?:svg|png|jpg|jpeg|gif|webp)$).*)',
  ],
}
