class ElementsReflex < ApplicationReflex

  def sort
    id = element.dataset[:id].to_i
    position = element.dataset[:position].to_i
    Element.find(id).insert_at(position)
  end
end
