initBurgerMenu();
initAutoHideHeader();

function initBurgerMenu() {
  const menuNavbar = document.getElementById("menu-navbar");
  const menuButton = document.getElementById("menu-button");
  
  menuButton.addEventListener("click", () => {
    menuNavbar.classList.toggle("expanded");
  });
}

function initAutoHideHeader() {
  const header = document.querySelector('header');
  let lastScrollTop = 0;
  let scrollThreshold = 100; // Pixels avant de déclencher l'effet
  
  window.addEventListener('scroll', () => {
    let scrollTop = window.pageYOffset || document.documentElement.scrollTop;
    
    // Si on est tout en haut, toujours montrer le header
    if (scrollTop <= scrollThreshold) {
      header.classList.remove('header-hidden');
      return;
    }
    
    // Si on scroll vers le bas, cacher le header
    if (scrollTop > lastScrollTop && scrollTop > scrollThreshold) {
      header.classList.add('header-hidden');
    } 
    // Si on scroll vers le haut, montrer le header
    else if (scrollTop < lastScrollTop) {
      header.classList.remove('header-hidden');
    }
    
    lastScrollTop = scrollTop;
  });
}
