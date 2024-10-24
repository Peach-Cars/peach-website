import { InertiaLink } from '@inertiajs/inertia-react';
import { ReactNode } from 'react';
import Container from '../components/layout/Container';
import Header from '../components/layout/Header';
import Footer from '../components/layout/Footer';

const Layout = ({ children }: any) => (
  <>
    <Container>
      <Header />

      <Container>
        <main className='min-h-[calc(100vh-12.6rem)] bg-white'>{children}</main>
      </Container>

      <Footer />
    </Container>
  </>
);

export default (page: ReactNode) => <Layout>{page}</Layout>;
