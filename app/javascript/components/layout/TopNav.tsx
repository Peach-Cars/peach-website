import { Link } from '@inertiajs/inertia-react';
import Container from './Container';
import { CheckmarkBadge01Icon, CallIcon, UserIcon } from '@hugeicons/react';

export default function TopNav() {
  return (
    <Container size="centered" className=" !bg-grayLight ">
      <section aria-label='Top secondary navigation bar' className="flex flex-row items-center justify-center md:justify-between h-[3.5rem] ">
        <div className="flex-row items-center justify-end hidden h-full gap-4 md:flex">
          <div>
            <CheckmarkBadge01Icon
              size={13.33}
              color={'#374151'}
              variant={'stroke'}
            />
          </div>

          <p className="text-[1rem]  text-textGray">
            Peach cars goes through levels of screening & inspection to protect
            our customers and match their quality expectations.
          </p>
        </div>

        <div className="flex justify-start gap-4 text-textGray">
          <div className="inline-flex items-center gap-3 ">
            <CallIcon size={16} color={'#374151'} variant={'twotone'} />
            <p className="text-[1.3rem] ">
              Call:{' '}
              <span>
                <a href="tel:+254709726900">0709 726900</a>
              </span>
            </p>
          </div>
          <div className="inline-flex items-center justify-center">
            <div className="w-px h-[3px] bg-darkBlue rounded-[1px]"></div>
          </div>
          <div className="inline-flex items-center gap-3 ">
            <UserIcon size={16} color={'#374151'} variant={'twotone'} />
            <Link className="block text-[1.3rem] " href="">
              Sign in
            </Link>
          </div>
        </div>
      </section>
    </Container>
  );
}
