module ApplicationHelper
  def shallow_args(namespace, parent, child)
    if namespace.nil?
      child.try(:new_record?) ? [parent, child] : child
    else
      child.try(:new_record?) ? [namespace, parent, child] : [namespace, child]
    end
  end
end
