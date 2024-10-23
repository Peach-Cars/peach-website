import { useForm } from '@inertiajs/inertia-react';

export default function NewsletterForm() {
  const { data, setData, errors, processing, post } = useForm({
    email: '',
    full_name: '',
  });
  const submit = (e: React.FormEvent<HTMLFormElement>) => {
    e.preventDefault();
    // post('')
  };
  return (
    <>
      <form
        onSubmit={submit}
        className="flex flex-col justify-start w-full gap-6 py-6 md:gap-x-6 md:flex-row "
      >
        <input
          placeholder="Full Name..."
          value={data.full_name}
          onChange={e => setData('full_name', e.target.value)}
          className="h-[5rem] md:h-[4.5rem] rounded-[0.8rem]  md:w-[17rem] outline-none border border-lightGray placeholder:text-placeholderGray placeholder:text-[1.3rem]"
          type="text"
        />
        <input
          value={data.email}
          onChange={e => setData('email', e.target.value)}
          placeholder="Enter Email..."
          className="h-[5rem] md:h-[4.5rem] rounded-[0.8rem]  md:w-[17rem] outline-none border border-lightGray placeholder:text-placeholderGray placeholder:text-[1.3rem]"
          type="email"
        />
        <button
          type="submit"
          className="h-[4.5rem]  px-6 text-white bg-pinkDark rounded-[1rem] text-[1.3rem]"
          disabled={processing}
        >
          Submit
        </button>
      </form>
    </>
  );
}
