import { Link } from '@inertiajs/inertia-react';
import NewsletterForm from './NewsletterForm';
import Socials from './Socials';

export default function FooterContent() {
  const phoneNumber = '+25736334488';
  const message =
    'Hello, I would like to know how you can help me buy or sell my car.';
  const whatsappLink = `https://api.whatsapp.com/send?phone=44${phoneNumber}&text=${encodeURIComponent(message)}`;

  return (
    <div className="text-textGray">
      <h1 className="text-[2rem] leading-[2rem] font-[700]">
        Help and Support
      </h1>
      <div className="flex flex-col items-start justify-start mt-6  md:justify-end md:space-x-[6rem] md:flex-row">
        <div className="flex w-full flex-col items-start justify-start gap-10 md:gap-0 md:gap-y-8  text-[1.3rem] leading-[2rem] ">
          <div className="space-y-2 ">
            <p className="text-nowrap">Monday to Saturday 9AM &ndash; 5PM</p>
            <p>Sundays &ndash; Closed</p>
            <p>Public Holidays 9AM &ndash; 5PM</p>
            <small className="leading-[1.5rem]">
              {' '}
              * Pre&ndash;arranged viewing conducted outside business hours{' '}
            </small>
          </div>
          <div className="">
            <h4 className="font-[700] mb-5">Our Other Lines</h4>
            <div className="space-y-2">
              <p>
                Safaricom: <a href="tel:+254715004488">0715 004488</a>
              </p>
              <p>
                Airtel: <a href="tel:+254736334488"> 0736 334488</a>
              </p>
              <p>
                Whatsapp:{' '}
                <a
                  href={whatsappLink}
                  target="_blank"
                  rel="noopener noreferrer"
                >
                  0736 334488
                </a>
              </p>
              <p>
                {' '}
                <a
                  className="text-nowrap"
                  href="mailto:inquiries@peach-technology.com"
                >
                  inquiries@peach-technology.com
                </a>
              </p>
            </div>
          </div>
          <div className="hidden md:block">
            <Socials/>
          </div>
        </div>
        <div className="flex w-full flex-col items-start mt-12 md:mt-0 justify-start gap-10 md:gap-0 md:gap-y-8 text-[1.3rem] leading-[2rem]  ">
          <div className="">
            <h4 className="font-[700] mb-5">Peach Process</h4>
            <div className="space-y-2">
              <Link className="block" href="">
                Buying Process
              </Link>
              <Link className="block" href="">
                Selling Process
              </Link>
              <Link className="block" href="">
                Financing
              </Link>
              <Link className="block" href="">
                Inspection
              </Link>
            </div>
          </div>
          <div className="">
            <h4 className="font-[700] mb-5">Resources</h4>
            <div className="space-y-2">
              <Link className="block" href="">
                Blog
              </Link>
              <Link className="block" href="">
                FAQs
              </Link>
              <Link className="block" href="">
                Glossary
              </Link>
            </div>
          </div>
        </div>
        <div className="flex flex-col items-start justify-start w-full mt-10 md:w-auto md:mt-0">
          <div className="flex flex-col items-start justify-start w-full md:flex-row md:justify-start md:gap-x-12">
            <div className="flex w-full w-max flex-col items-start justify-start gap-10 md:gap-0 md:gap-y-8 text-[1.3rem] leading-[2rem] ">
              <div className="">
                <h4 className="font-[700] mb-5">About Us</h4>
                <div className="space-y-2">
                  <Link className="block" href="">
                    About Peach
                  </Link>
                  <Link className="block" href="">
                    Meet our Team
                  </Link>
                  <Link className="block" href="">
                    Work With Us
                  </Link>
                </div>
              </div>
            </div>
            <div className="flex w-full  md:w-max  flex-col items-start justify-start gap-10 md:gap-0 md:gap-y-8 text-[1.3rem] leading-[2rem] mt-12 md:mt-0 ">
              <div className="md:pl-12">
                <div className="mb-12">
                  {' '}
                  <h4 className="font-[700] mb-5">Our Locations</h4>
                  <div className="mb-5 space-y-2">
                    <p className="text-nowrap">Peach Cars &ndash; Lavington</p>
                    <p>James Gichuru Road</p>
                    <a
                      className="block underline underline-offset-2"
                      href="https://goo.gl/maps/4etrLiKvs6BTMqV3A"
                      target="_blank"
                      rel="nofollow noopener noreferrer"
                    >
                      Lavington, Nairobi
                    </a>
                  </div>
                </div>
                <div>
                  <div className="space-y-2">
                    <p className="text-nowrap">Peach Cars &ndash; Windsor</p>
                    <p>Kiambu Road</p>
                    <a
                      className="block underline underline-offset-2"
                      href="https://maps.app.goo.gl/gzEPB8LdhvY4PynCA"
                      target="_blank"
                      rel="nofollow noopener noreferrer"
                    >
                      Windsor, Northern &ndash; bypass
                    </a>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <div className="w-full pt-14">
            <h1 className="text-[2rem] font-[700] ">Peach Newsletter</h1>
            <p className="leading-[2rem] text-[1.3rem] text-darkBlueish">
              <span>
                Sign up for our newsletter to get updates
                <br />
                straight into your inbox.
              </span>
            </p>
           <NewsletterForm/>
          </div>
        </div>
      </div>
    </div>
  );
}
