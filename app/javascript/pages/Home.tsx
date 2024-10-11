import { Head } from '@inertiajs/inertia-react';
import Container from '../components/layout/Container';

interface HomeProps {
  
}

export default function Home({  }: HomeProps) {
  return (
    <Container className="">
      <Head title="Peach Cars | Home" />
    </Container>
  );
}
