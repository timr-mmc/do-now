import { redirect } from 'next/navigation'
import { createClient } from '@/utils/supabase/server'

export default function SetupClassPage() {
  async function createClass(formData: FormData) {
    'use server'

    const className = formData.get('className') as string
    const yearGroup = formData.get('yearGroup') as string
    const subject = formData.get('subject') as string

    const supabase = await createClient()
    
    const {
      data: { user },
    } = await supabase.auth.getUser()

    if (!user) {
      redirect('/login')
    }

    const { error } = await supabase
      .from('profiles')
      .insert({
        user_id: user.id,
        class_name: className,
        year_group: yearGroup || null,
        subject: subject || 'Mathematics',
      })

    if (error) {
      console.error('Error creating class:', error.message)
      redirect('/setup-class?error=' + encodeURIComponent(error.message))
    }

    redirect('/dashboard')
  }

  return (
    <div className="flex min-h-screen items-center justify-center bg-gray-50 px-4 py-12 sm:px-6 lg:px-8">
      <div className="w-full max-w-md space-y-8">
        <div>
          <h2 className="mt-6 text-center text-3xl font-bold tracking-tight text-gray-900">
            Set up your first class
          </h2>
          <p className="mt-2 text-center text-sm text-gray-600">
            Create a class to get started with Do-Now
          </p>
        </div>
        <form className="mt-8 space-y-6" action={createClass}>
          <div className="space-y-4">
            <div>
              <label htmlFor="className" className="block text-sm font-medium leading-6 text-gray-900">
                Class Name *
              </label>
              <input
                id="className"
                name="className"
                type="text"
                required
                placeholder="e.g., Year 10 Maths"
                className="mt-1 block w-full rounded-md border-0 px-3 py-2 text-gray-900 ring-1 ring-inset ring-gray-300 placeholder:text-gray-400 focus:ring-2 focus:ring-inset focus:ring-indigo-600 sm:text-sm sm:leading-6"
              />
            </div>

            <div>
              <label htmlFor="yearGroup" className="block text-sm font-medium leading-6 text-gray-900">
                Year Group
              </label>
              <input
                id="yearGroup"
                name="yearGroup"
                type="text"
                placeholder="e.g., Year 10, Grade 8"
                className="mt-1 block w-full rounded-md border-0 px-3 py-2 text-gray-900 ring-1 ring-inset ring-gray-300 placeholder:text-gray-400 focus:ring-2 focus:ring-inset focus:ring-indigo-600 sm:text-sm sm:leading-6"
              />
            </div>

            <div>
              <label htmlFor="subject" className="block text-sm font-medium leading-6 text-gray-900">
                Subject
              </label>
              <input
                id="subject"
                name="subject"
                type="text"
                defaultValue="Mathematics"
                className="mt-1 block w-full rounded-md border-0 px-3 py-2 text-gray-900 ring-1 ring-inset ring-gray-300 placeholder:text-gray-400 focus:ring-2 focus:ring-inset focus:ring-indigo-600 sm:text-sm sm:leading-6"
              />
            </div>
          </div>

          <div>
            <button
              type="submit"
              className="group relative flex w-full justify-center rounded-md bg-indigo-600 px-3 py-2 text-sm font-semibold text-white hover:bg-indigo-500 focus-visible:outline focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-indigo-600"
            >
              Create Class
            </button>
          </div>
        </form>
      </div>
    </div>
  )
}
