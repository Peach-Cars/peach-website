import { InertiaLink } from "@inertiajs/inertia-react";

const Layout = ({children}) => (
  <>
<div className="min-h-full">
  <nav className="bg-gray-200 shadow-sm">
    <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
      <div className="flex justify-between h-16">
        <div className="flex">
          <div className="flex-shrink-0 flex items-center">
        
          </div>
         
        </div>
      </div>
    </div>
  </nav>

  <div className="py-10">
    <main>
      <div className="max-[1300px] mx-auto sm:px-6 lg:px-8">
        
        <div className="px-4 py-8 sm:px-0">
          <div className="bg-gray-200 rounded-lg h-screen p-3">
            {children}
          </div>
        </div>
       
      </div>
    </main>
  </div>
</div>

  </>
)



export default page => <Layout>{page}</Layout>;
