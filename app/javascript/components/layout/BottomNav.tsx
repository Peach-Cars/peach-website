import Container from './Container';
import logo from '@/assets/logo.svg';
import { Link } from '@inertiajs/inertia-react';
import { FavouriteIcon, Menu11Icon } from '@hugeicons/react';
import { useEffect, useState } from 'react';

export default function BottomNav() {
  const [iconSize, setIconSize] = useState(14);

  useEffect(() => {
    const updateSize = () => {
      const screenWidth = window.innerWidth;
      if (screenWidth >= 1024) {
        setIconSize(14);
      } else if (screenWidth >= 768) {
        setIconSize(14);
      } else if (screenWidth >= 640) {
        setIconSize(20);
      } else {
        setIconSize(20);
      }
    };
    updateSize();
    window.addEventListener('resize', updateSize);

    return () => window.removeEventListener('resize', updateSize);
  }, []);

  return (
    <Container size="centered" className="h-full px-6 md:px-0">
      <section
        aria-label="Bottom main navigation bar"
        className="flex items-center h-[6.1rem]"
      >
        <article className=" pr-[5rem]" aria-label="logo">
          <img src={logo} alt="Logo" className="w-10 h-[3.5rem] w-[2.8rem]" />
        </article>
        <article
          className="flex items-center justify-between text-[1.3rem] text-textGray flex-1 "
          aria-label="Navigation links"
        >
          <div
            className="flex items-center gap-6"
            role="navigation"
            aria-label="Main navigation"
          >
            <Link href="" aria-label="Buy a car page">
              Buy a Car
            </Link>
            <Link href="" aria-label="Sell a car page">
              Sell a Car
            </Link>
            <Link href="" aria-label="Get inspection page">
              Get Inspection
            </Link>
          </div>
          <div
            className="items-center gap-6 md:flex"
            role="navigation"
            aria-label="Secondary nav links"
          >
            <Link
              href="#"
              className="hidden md:inline-flex"
              aria-label="Peach processes a car page"
            >
              Peach Processes
            </Link>
            <Link
              href="#"
              className="hidden md:inline-flex"
              aria-label="Resourceful links a car page"
            >
              Resources
            </Link>
            <Link
              href="#"
              className="hidden md:inline-flex"
              aria-label="About us page"
            >
              About Us
            </Link>
            <div className="inline-flex items-center gap-3 ">
              <FavouriteIcon
                size={iconSize}
                color={'#1F2937'}
                variant={'twotone'}
              />
              <Link
                href="#"
                className="hidden md:inline-flex"
                aria-label="Get inspection page"
              >
                Wishlist
              </Link>
            </div>
            <div className='inline-flex pl-6 md:hidden'>
              <Menu11Icon size={20} color={'#1F2937'} variant={'twotone'} />
            </div>
          </div>
        </article>
      </section>
    </Container>
  );
}
