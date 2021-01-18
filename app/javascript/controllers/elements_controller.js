import ApplicationController from './application_controller'
import Sortable from "sortablejs"


export default class extends ApplicationController {

  connect() {
    super.connect()
    const element = document.getElementById('elements');
    const options = { animation: 150, onEnd: this.updatePosition.bind(this) }
    if (element) Sortable.create(element, options) 
  }

  updatePosition(event) {
    const draggedItem = event.item
    draggedItem.dataset.position = event.newIndex + 1;
    this.stimulate('ElementsReflex#sort', draggedItem);
  }
}
