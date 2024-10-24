import { useForm } from '@inertiajs/inertia-react';
import Input from '../shared/Input';

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
        <Input
          className="h-[5rem] md:h-[4.5rem] md:w-[17rem]"
          type="text"
          handleChange={e => setData('full_name', e.target.value)}
          value={data.full_name}
          placeholder="Full Name..."
        />
        <Input
          className="h-[5rem] md:h-[4.5rem] md:w-[17rem]"
          type="text"
          handleChange={e => setData('email', e.target.value)}
          value={data.email}
          placeholder="Enter Email..."
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
