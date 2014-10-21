#! /usr/bin/env ruby
# -*- coding: utf-8 -*-

class Shape

  @@Autor = "Kamil"

  def initialize(name, x, y)
    @name, @x, @y = name, x, y
  end

  # Podstawowy Setter
  def name=(name)
    @name = name
  end

  # Jest rowny
  #      ||

  attr_writer :name
  attr_reader :name
  # Dostepne rowniez accesory

  # get/set
  attr_accessor :x

  # get
  attr_reader :y

  # Przez uzycie self deklarujemy metode statyczna
  def self.mow(msg)
    puts msg + name
  end

  def Autor
    @@Autor
  end
end
# ==> nil

##########################
kolo = Shape.new(kolo,10,5);
kolo.Autor
# ==> "Kamil"
kolo.name="Koło"
# ==> "Ko\305\202o"
kolo.y
# ==> 5
# kolo.y = 10; zwrociło by błąd


# Znaczek dziedziczenia jest tez ciekawy
class Square < Shape
 attr_accessor :bok

 def initialize(bok)
   @bok=bok
   @name = 'Kwadrat'
 end

   # Nie potrzeba pisac return
   def Pole
     bok*bok
   end
 end
# ==> nil

##########################
kwadrat = Square.new(10)
# ==> #<Square:0xb739d05c @name="Kwadrat", @bok=10>

# Można rozszezyc istniejace juz klasy
class Square
  def Ala_ma_kota!
    @name="Ala ma kota"
  end
end
# ==> nil

# Istnieją też moduly
module CatHasAla
  # Można uzywać różnych znaków w nazwie metod np !,?,=
  def isHasAla?
    true
  end
end
# ==> nil

#Przyklad wdrazania modulu
class Square
 include CatHasAla
end
# ==> Square

# Instantiate a class
kwadracik = Square.new(2)
# ==> #<Square:0xb7378a7c @name="Kwadrat", @bok=2>
kwadracik.isHasAla?
# ==> true

nowyKwadrat = Square.new(2)
# ==> #<Square:0xb7374c38 @name="Kwadrat", @bok=2>

# Wszystkie metody instancji
Square.instance_methods
# ==> ["inspect", "name", "tap", "clone", "public_methods", "__send__", "name=", "object_id", "instance_variable_defined?", "equal?", "freeze", "bok", "Ala_ma_kota!", "extend", "x", "send", "methods", "bok=", "hash", "x=", "dup", "to_enum", "instance_variables", "eql?", "instance_eval", "id", "y", "singleton_methods", "taint", "enum_for", "frozen?", "instance_variable_get", "instance_of?", "display", "to_a", "method", "Autor", "isHasAla?", "type", "instance_exec", "protected_methods", "==", "Pole", "===", "instance_variable_set", "kind_of?", "respond_to?", "to_s", "class", "private_methods", "=~", "tainted?", "__id__", "untaint", "nil?", "is_a?"]

# Metody zdefiniowane przez creatora
Square.instance_methods(false)
# ==> ["bok=", "Ala_ma_kota!", "Pole", "bok"]

# Wywołajmy pare metod ;)
kwadracik.name 
# ==> "Kwadrat"
kwadracik.name = "Prostokat" 
# ==> "Prostokat"
kwadracik.name 
# ==> "Prostokat"
nowyKwadrat.Ala_ma_kota!
# ==> "Ala ma kota"
nowyKwadrat.name
# ==> "Ala ma kota"

# Wywołaj metode statyczna
Square.mow('Hi')
# =HiSquare
# ==> nil

# Zasieg zmiennych jest oznaczany przez sposob zapisu zmiennych
# Zmienne zaczynajace sie od $ sa zmiennymi globalnymi
$var = "Jestem zmienna globalną"
# ==> "Jestem zmienna globalną"
defined? $var 
# ==> "global-variable"

# Zmienne zaczynajace sie od @ sa zwyklymi zmiennymi 
@var = "Jestem zmienna instancji"
# ==> "Jestem zmienna instancji"
defined? @var
# ==> "instance-variable"

# Zmienne zaczynajace sie od @@ sa zmiennymi klasy
@@var = "Jestem zmienna klasy"
# ==> "Jestem zmienna klasy"
defined? @@var
# ==> "class variable"

# Zmienne zaczynajace sie na wielka litere sa Stałymi
Var = "Jestem stała"
# ==> "Jestem stała"
defined? Var
# ==> "constant"

