import BottomNav from './BottomNav';
import Container from './Container';
import TopNav from './TopNav';

export default function Header() {
  return (
    <Container className="">
      <nav aria-label="Navigation bar">
        <div
          className="bg-grayLight"
          aria-label="Secondary navigation"
        >
          <TopNav/>
        </div>

        <div
          aria-label="Main navigation bar"
          className="h-[6.1rem] bg-white border-b border-grayLight"
        >
          <BottomNav/>
        </div>
      </nav>
    </Container>
  );
}
