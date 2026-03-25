import { NextResponse, type NextRequest } from 'next/server'
import { updateSession } from './src/utils/supabase/middleware'
import { createServerClient } from '@supabase/ssr'

export async function middleware(request: NextRequest) {
  // First update the session
  const response = await updateSession(request)
  
  // Get the user from the session
  const supabase = createServerClient(
    process.env.NEXT_PUBLIC_SUPABASE_URL!,
    process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY!,
    {
      cookies: {
        getAll() {
          return request.cookies.getAll()
        },
        setAll(cookiesToSet) {
          cookiesToSet.forEach(({ name, value }) => request.cookies.set(name, value))
        },
      },
    }
  )

  const {
    data: { user },
  } = await supabase.auth.getUser()

  // If user is logged in and not on auth pages or setup-class page
  if (user && !request.nextUrl.pathname.startsWith('/auth') && !request.nextUrl.pathname.startsWith('/setup-class')) {
    // Check if user has any profiles
    const { data: profiles, error } = await supabase
      .from('profiles')
      .select('id')
      .eq('user_id', user.id)
      .limit(1)

    // If no profiles exist, redirect to setup
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
     * Feel free to modify this pattern to include more paths.
     */
    '/((?!_next/static|_next/image|favicon.ico|.*\\.(?:svg|png|jpg|jpeg|gif|webp)$).*)',
  ],
}
