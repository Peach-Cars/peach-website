import { Link } from '@inertiajs/inertia-react';
import Container from './Container';
import FooterValueProp from './FooterValueProp';
import FooterContent from './FooterContent';

export default function Footer() {
  const currentYear= new Date().getFullYear()
  return (
    <Container size="centered" className='px-6 md:px-0'>
      <footer>
        <div className="bg-pinkDark min-h-[11.9rem] rounded-[10px] mb-5">
          <FooterValueProp />
        </div>
        <div className="bg-pinkLight min-h-[40rem] rounded-[10px] mb-4 px-6 py-10 md:px-8 md:py-8">
          <FooterContent/>
        </div>

        <div className="flex items-center justify-start flex-wrap md:flex-nowrap md:justify-between pb-4 text-[1.3rem] text-textGray ">
          <p className=''>Peach Cars &copy; {currentYear}. All rights reserved</p>
          <div className="flex flex-wrap justify-start pt-4 gap-x-6 md:pt-0">
            <Link href="#">Terms &amp; Conditions</Link>
            <Link href="#">Privacy</Link>
            <Link href="#">Cookies</Link>
            <Link href="#">Disclaimer</Link>
          </div>
        </div>
      </footer>
    </Container>
  );
}
