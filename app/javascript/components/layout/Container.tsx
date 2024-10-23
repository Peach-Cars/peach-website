interface ContainerProps {
  children: React.ReactNode;
  className?: string;
  size?: 'full' | 'centered';
}

export default function Container({
  children,
  className = '',
  size = 'full',
}: ContainerProps) {
  const containerClass = size === 'full' ? 'w-full ' : 'max-w-[95rem]  mx-auto ';

  return (
    <div className={`${containerClass} ${className} bg-white`}>
      <div className="font-satoshi">{children}</div>
    </div>
  );
}

