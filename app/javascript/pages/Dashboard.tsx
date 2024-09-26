import { Head } from '@inertiajs/inertia-react';
import React from 'react';

export default function Dashboard({ name }: { name: string }) {
  return (
    <>
      <Head title="Home" />
      <h1 className="mb-4 text-3xl font-bold leading-tight text-white">
        Peach Cars {name}
      </h1>
    </>
  );
}
