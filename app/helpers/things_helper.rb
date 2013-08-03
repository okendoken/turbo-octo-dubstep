module ThingsHelper
  def thing_link(thing)
    link_to thing.name, thing
  end
end
