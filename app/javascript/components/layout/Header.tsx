import Container from './Container';

export default function Header() {
  return (
    <Container className="">
      <nav aria-label="Navigation bar">
        <div
          className="h-[3.5rem] bg-grayLight"
          aria-label="Secondary navigation"
        ></div>

        <div
          aria-label="Main navigation bar"
          className="h-[6.1rem] bg-white border-b border-grayLight"
        ></div>
      </nav>
    </Container>
  );
}
