const filterButtons = document.querySelectorAll("[data-filter]");

filterButtons.forEach((button) => {
  button.addEventListener("click", () => {
    const type = button.dataset.filter;
    const cards = document.querySelectorAll("[data-type]");

    filterButtons.forEach((item) => item.classList.remove("active"));
    button.classList.add("active");

    cards.forEach((card) => {
      const show = type === "all" || card.dataset.type === type;
      card.style.display = show ? "block" : "none";
    });
  });
});
