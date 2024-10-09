import { InertiaLink } from '@inertiajs/inertia-react';
import { ReactNode } from 'react';

const Layout = ({ children }: any) => (
  <>
    <div className="min-h-full">
      <nav className="bg-gray-700 shadow-sm">
        <div className="px-4 mx-auto max-w-7xl sm:px-6 lg:px-8">
          <div className="flex justify-between h-16">
            <div className="flex">
              <div className="flex items-center flex-shrink-0"></div>
            </div>
          </div>
        </div>
      </nav>

      <div className="py-10">
        <main>
          <div className="max-[1300px] mx-auto sm:px-6 lg:px-8">
            <div className="">
              <div className="">{children}</div>
            </div>
          </div>
        </main>
      </div>
    </div>
  </>
);

export default (page: ReactNode) => <Layout>{page}</Layout>;
