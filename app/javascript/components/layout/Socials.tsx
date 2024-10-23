import {
  InstagramIcon,
  TiktokIcon,
  Linkedin02Icon,
  Facebook02Icon,
  TwitterIcon,
  YoutubeIcon,
} from '@hugeicons/react';
export default function Socials() {
  const socials = [
    {
      icon: <InstagramIcon size={20} color={'#000000'} variant={'twotone'} />,
      link: 'https://www.instagram.com/PeachCarsKE/',
    },
    {
      icon: <TiktokIcon size={20} color={'#000000'} variant={'twotone'} />,
      link: 'https://www.tiktok.com/@peachcarske',
    },
    {
      icon: <Linkedin02Icon size={20} color={'#000000'} variant={'stroke'} />,
      link: 'https://www.linkedin.com/company/peachcarske/',
    },
    {
      icon: <Facebook02Icon size={20} color={'#000000'} variant={'twotone'} />,
      link: 'https://www.facebook.com/PeachCarsKE',
    },
    {
      icon: <TwitterIcon size={20} color={'#000000'} variant={'twotone'} />,
      link: 'https://twitter.com/PeachCarsKE',
    },
    {
      icon: <YoutubeIcon size={20} color={'#000000'} variant={'twotone'} />,
      link: 'https://www.youtube.com/channel/UCdbv0EV4pDIX4LlUIbcmIxw',
    },
  ];
  return (
    <div className="flex items-center justify-start pt-14 gap-x-6">
      {socials.map((social, index) => (
        <div key={index}>
          <a href={social.link} target="_blank" rel="noopener noreferrer">
            {social.icon}
          </a>
        </div>
      ))}
    </div>
  );
}
