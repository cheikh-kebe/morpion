class BoardCase# creer la classe case du jeu 

  attr_accessor :value, :case_number
  
  def initialize(case_number)# init de la valeur de la case et le nom de la case
    @value = "" #la valeur de la case est vide 
    @case_number = case_number #le numero de la case
  end
  
  def to_s
    # renvoie la valeur au format string
    self.value = @value 
  end

end 

