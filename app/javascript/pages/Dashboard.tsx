import { Head } from '@inertiajs/inertia-react';

interface DashboardProps {
  name: string;
  tagline: string;
}

export default function Dashboard({ name, tagline }: DashboardProps) {
  return (
    <>
      <Head title="Home" />
      <h1 className="mb-4 text-3xl font-bold leading-tight text-white">
        {' '}
        Peach cars {name}
      </h1>
    </>
  );
}
