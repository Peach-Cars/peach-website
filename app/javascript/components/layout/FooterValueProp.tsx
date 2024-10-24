import { Car03Icon, Search02Icon, UserMultipleIcon } from '@hugeicons/react';
export default function FooterValueProp() {
  let valueItems = [
    {
      icon: <Car03Icon size={24} color={'#fff'} variant={'twotone'} />,
      title: 'Verified Cars',
      content:
        'Cars go through multiple levels of screening and inspection to protect our customers and match their quality expectations.',
    },
    {
      icon: <Search02Icon size={24} color={'#fff'} variant={'twotone'} />,
      title: 'Clear Processes',
      content:
        'Our team takes on the purchasing and ownership process for you, step-by-step.',
    },
    {
      icon: (
        <UserMultipleIcon size={24} color={'#fff'} variant={'twotone'} />
      ),
      title: 'Team Diversity',
      content:
        'Peach Cars comprises both locals and expats who are experienced in every level of the car value chain.',
    },
  ];

  return (
    <div className="flex flex-col items-start justify-start gap-5 px-6 py-10 md:px-8 md:py-8 md:items-start md:flex-row gap-x-6 ">
      {valueItems.map((item, index) => (
        <div key={index} className="flex-1 max-w-[35rem] sm:max-w-[40rem] md:w-[27rem] text-white text-[1.3rem] leading-[1.755rem] mb-6 md:mb-0">
          <div className="inline-flex gap-5 mb-6 items-end font-[700]">
            <i>{item.icon}</i>
            <p className='text-[1.3rem]'>{item.title}</p>
          </div>
          <p className="leading-[1.755rem]">{item.content}</p>
        </div>
      ))}
    </div>
  );
}
