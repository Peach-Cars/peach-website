import { Head } from '@inertiajs/inertia-react';
import Container from '../components/layout/Container';

interface DashboardProps {
  name: string;
  tagline: string;
}

export default function Dashboard({ name, tagline }: DashboardProps) {
  return (
    <Container className="">
      <Head title="Peach Cars | Home" />
    </Container>
  );
}
