	const navbar_login = document.querySelector("#desktop .header .login");
	const navbar_login_menu = document.querySelector("#desktop .header .login .nav");
	
	const headerM_menuBtn = document.querySelector(".headerM_menuBtn");
	const navbarM = document.querySelector(".navbarM");
	
	const topmenuM_leports = document.querySelector(".topmenuM_leports");
	const submenuM_leports = document.querySelector(".submenuM_leports");
	
	const topmenuM_trade = document.querySelector(".topmenuM_trade");
	const submenuM_trade = document.querySelector(".submenuM_trade");
	
	navbar_login.addEventListener("click", () => {
		navbar_login_menu.classList.toggle("active");
	});
		
	headerM_menuBtn.addEventListener("click", () => {
		navbarM.classList.toggle("active");
	});
	
	topmenuM_leports.addEventListener("click", () => {
		submenuM_leports.classList.toggle("active");
	});

	topmenuM_trade.addEventListener("click", () => {
		submenuM_trade.classList.toggle("active");
	});
