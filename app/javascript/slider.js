window.addEventListener('load', () => {
    const left = document.querySelector('.button-prev');
    const right = document.querySelector('.button-next');

    const slider = document.querySelector('.slider-line');
    const images = document.querySelectorAll('.slider-line img');


    let counter = 0;
    const stepSize = images[0].clientWidth;
    console.log(right)

    slider.style.transform = `translateX(${-stepSize*counter}px)`

    right.addEventListener('click', () =>{
        counter >= images.length - 1 ? (counter = -1) : null;
        console.log(counter)
        console.log(images.length)
        slider.classList.add('transformAnimation')
        counter++;
        slider.style.transform = `translateX(${-stepSize*counter}px)`
    });

    left.addEventListener('click', () =>{
        if (counter <= 0) counter = images.length;
        console.log(counter)
        console.log(images.length)
        slider.classList.add('transformAnimation')
        counter--;
        slider.style.transform = `translateX(${-stepSize*counter}px)`
    })
})