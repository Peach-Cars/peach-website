import { useEffect, useRef } from 'react';

interface InputProps {
  type?: string;
  name?: string;
  value?: string | number;
  className?: string;
  autoComplete?: string;
  required?: boolean;
  isFocused?: boolean;
  onFocus?: () => void;
  onBlur?: () => void;
  placeholder?: string;
  handleChange: (e: React.ChangeEvent<HTMLInputElement>) => void;
  multiple?: boolean;
  accept?: string;
  readonly?: boolean;
  id?: string;
  checked?: boolean;
  maxLength?: number;
}

export default function Input({
  type = 'text',
  name,
  value,
  className,
  autoComplete,
  required,
  isFocused,
  onFocus,
  onBlur,
  placeholder,
  handleChange,
  multiple,
  accept,
  readonly,
  id,
  checked,
  maxLength,
}: InputProps) {
  const input = useRef<HTMLInputElement>(null); 

  useEffect(() => {
    if (isFocused && input.current) {
      input.current.focus();
    }
  }, [isFocused]);

  return (
    <div className="flex flex-col items-start">
      <input
        type={type}
        name={name}
        value={value}
        className={
          `border border-lightGray outline-none placeholder:text-placeholderGray placeholder:text-[1.3rem] text-[1.3rem] rounded-[0.8rem] focus:border-indigo-300 focus:ring focus:ring-indigo-200 focus:ring-opacity-50 shadow-sm ` +
          className
        }
        ref={input}
        id={id}
        accept={accept}
        multiple={multiple}
        maxLength={maxLength}
        placeholder={placeholder}
        autoComplete={autoComplete}
        required={required}
        checked={checked}
        readOnly={readonly}
        onFocus={onFocus}
        onBlur={onBlur}
        onChange={handleChange} 
      />
    </div>
  );
}
