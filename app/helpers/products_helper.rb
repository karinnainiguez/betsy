module ProductsHelper

  def rating_icon(categories)
    categories.each do |category|
      if category == 'horse'
        icon = "horse-icon.png"
        break
      elsif category == 'dog'
        icon = "dog-icon.png"
        break
      elsif category == 'cat'
        icon = "cat-icon.png"
        break
      elsif category == 'unicorn'
        icon = "unicorn-icon.jpeg"
        break
      elsif category == 'hedgehog'
        icon = "hedge-icon.png"
        break
      elsif category == 'chicken'
        icon = "chicken-icon.jpeg"
        break
      elsif category == 'panda'
        icon = "panda-icon.png"
        break
      elsif category =='narwhal'
        icon = "narwhal-icon.png"
        break
      elsif category == 'fish'
        icon = "fish-icon.png"
        break
      elsif category == 'ferret'
        icon = "ferret-icon.jpeg"
        break
      elsif category == 'hamster'
        icon = "hamster-icon.png"
        break
      elsif category == 'chinchilla'
        icon = "chinchilla-icon.png"
        break
      elsif category == 'turtle'
        icon = "turtle-icon.png"
        break
      elsif category =='pony'
        icon = "pony-icon.jpeg"
        break
      else
        icon = "star-icon.png"
      end
      return icon
    end
  end
end
