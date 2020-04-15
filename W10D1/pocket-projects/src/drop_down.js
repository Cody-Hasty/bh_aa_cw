
const dogs = {
  "Corgi": "https://www.akc.org/dog-breeds/cardigan-welsh-corgi/",
  "Australian Shepherd": "https://www.akc.org/dog-breeds/australian-shepherd/",
  "Affenpinscher": "https://www.akc.org/dog-breeds/affenpinscher/",
  "American Staffordshire Terrier": "https://www.akc.org/dog-breeds/american-staffordshire-terrier/",
  "Tosa": "https://www.akc.org/dog-breeds/tosa/",
  "Labrador Retriever": "https://www.akc.org/dog-breeds/labrador-retriever/",
  "French Bulldog": "https://www.akc.org/dog-breeds/french-bulldog/" 
};

function dogLinkCreator() {
  let dogLinks = [];
  for (const dog in dogs) {
    let link = document.createElement("A");
    link.setAttribute("href", dogs[dog]);
    link.innerHTML = dog;
    let list = document.createElement("LI");
    list.setAttribute("class", "dog-link");
    list.appendChild(link);
    dogLinks.push(list);
  }
  return dogLinks;
}

function attachDogLinks() {
  let dogLinks = dogLinkCreator();
  console.log(dogLinks);
  dogLinks.forEach((link) => {
    let element = document.getElementsByClassName('drop-down-dog-list');
    element[0].appendChild(link);
  });
}

function handleEnter(){
  //show li
  // document.getElementsByClassName('dog-link').removeAttribute('style');
  var eles = Array.from(document.getElementsByClassName('dog-link'));
  eles.forEach((ele) => {
    ele.setAttribute('class', 'peeping-dogs');
  })
}

function handleLeave() {
  //hide li
  var eles = Array.from(document.getElementsByClassName('peeping-dogs'));
  eles.forEach((ele) => {
    ele.setAttribute('class', 'dog-link');
  })
}

attachDogLinks();
// handleEnter();
// handleLeave();
const mouseTarget = document.getElementById('tag');

mouseTarget.addEventListener('mouseenter', e => {
  handleEnter();
});

mouseTarget.addEventListener('mouseleave', e => {
  handleLeave();
});