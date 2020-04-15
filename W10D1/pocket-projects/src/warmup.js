
const partyHeader = document.getElementById('party');

export const htmlGenerator = (string, htmlElement) => {
    var node = document.createElement("P");
    var textnode = document.createTextNode(string);
    //console.log(node.hasChildNodes());
    if (htmlElement.hasChildNodes()) {
      let children = Array.from(htmlElement.children);
      for (let i = 0; i < children.length; i++) {
        htmlElement.removeChild(children[i]);
      }
    }
    node.appendChild(textnode);
    htmlElement.appendChild(node);
  };

htmlGenerator('Party Time.', partyHeader);