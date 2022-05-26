# Контекст определяет интерфейс, представляющий интерес для клиентов.
class Context
    # Контекст хранит ссылку на один из объектов Стратегии. Контекст не знает
    # конкретного класса стратегии. Он должен работать со всеми стратегиями через
    # интерфейс Стратегии.
    # @return [Strategy]
    attr_writer :strategy
  
    # Обычно Контекст принимает стратегию через конструктор, а также предоставляет
    # сеттер для её изменения во время выполнения.
    #
    # @param [Strategy] strategy
    def initialize(strategy)
      @strategy = strategy
    end
  
    # Обычно Контекст позволяет заменить объект Стратегии во время выполнения.
    #
    # @param [Strategy] strategy
    def strategy=(strategy)
      @strategy = strategy
    end
  
    # Вместо того, чтобы самостоятельно реализовывать множественные версии
    # алгоритма, Контекст делегирует некоторую работу объекту Стратегии.
    def do_some_business_logic
      # ...
  
      puts 'Context: Sorting data using the strategy (not sure how it\'ll do it)'
      result = @strategy.do_algorithm(%w[a b c d e])
      print result.join(',')
  
      # ...
    end
  end
  
  # Интерфейс Стратегии объявляет операции, общие для всех поддерживаемых версий
  # некоторого алгоритма.
  #
  # Контекст использует этот интерфейс для вызова алгоритма, определённого
  # Конкретными Стратегиями.
  #
  # @abstract
  class Strategy
    # @abstract
    #
    # @param [Array] data
    def do_algorithm(_data)
      raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
    end
  end
  
  # Конкретные Стратегии реализуют алгоритм, следуя базовому интерфейсу Стратегии.
  # Этот интерфейс делает их взаимозаменяемыми в Контексте.
  
  class ConcreteStrategyA < Strategy
    # @param [Array] data
    #
    # @return [Array]
    def do_algorithm(data)
      data.sort
    end
  end
  
  class ConcreteStrategyB < Strategy
    # @param [Array] data
    #
    # @return [Array]
    def do_algorithm(data)
      data.sort.reverse
    end
  end
  
  # Клиентский код выбирает конкретную стратегию и передаёт её в контекст. Клиент
  # должен знать о различиях между стратегиями, чтобы сделать правильный выбор.
  
  context = Context.new(ConcreteStrategyA.new)
  puts 'Client: Strategy is set to normal sorting.'
  context.do_some_business_logic
  puts "\n\n"
  
  puts 'Client: Strategy is set to reverse sorting.'
  context.strategy = ConcreteStrategyB.new
  context.do_some_business_logic















  # Интферфейс издателя объявляет набор методов для управлениями подписчиками.
#
# @abstract
class Subject
    # Присоединяет наблюдателя к издателю.
    #
    # @abstract
    #
    # @param [Observer] observer
    def attach(observer)
      raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
    end
  
    # Отсоединяет наблюдателя от издателя.
    #
    # @abstract
    #
    # @param [Observer] observer
    def detach(observer)
      raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
    end
  
    # Уведомляет всех наблюдателей о событии.
    #
    # @abstract
    def notify
      raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
    end
  end
  
  # Издатель владеет некоторым важным состоянием и оповещает наблюдателей о его
  # изменениях.
  class ConcreteSubject < Subject
    # Для удобства в этой переменной хранится состояние Издателя, необходимое всем
    # подписчикам.
    attr_accessor :state
  
    # @!attribute observers
    # @return [Array<Observer>] attr_accessor :observers private :observers
  
    def initialize
      @observers = []
    end
  
    # Список подписчиков. В реальной жизни список подписчиков может храниться в
    # более подробном виде (классифицируется по типу события и т.д.)
  
    # @param [Obserser] observer
    def attach(observer)
      puts 'Subject: Attached an observer.'
      @observers << observer
    end
  
    # @param [Obserser] observer
    def detach(observer)
      @observers.delete(observer)
    end
  
    # Методы управления подпиской.
  
    # Запуск обновления в каждом подписчике.
    def notify
      puts 'Subject: Notifying observers...'
      @observers.each { |observer| observer.update(self) }
    end
  
    # Обычно логика подписки – только часть того, что делает Издатель. Издатели
    # часто содержат некоторую важную бизнес-логику, которая запускает метод
    # уведомления всякий раз, когда должно произойти что-то важное (или после
    # этого).
    def some_business_logic
      puts "\nSubject: I'm doing something important."
      @state = rand(0..10)
  
      puts "Subject: My state has just changed to: #{@state}"
      notify
    end
  end
  
  # Интерфейс Наблюдателя объявляет метод уведомления, который издатели используют
  # для оповещения своих подписчиков.
  #
  # @abstract
  class Observer
    # Получить обновление от субъекта.
    #
    # @abstract
    #
    # @param [Subject] subject
    def update(_subject)
      raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
    end
  end
  
  # Конкретные Наблюдатели реагируют на обновления, выпущенные Издателем, к
  # которому они прикреплены.
  
  class ConcreteObserverA < Observer
    # @param [Subject] subject
    def update(subject)
      puts 'ConcreteObserverA: Reacted to the event' if subject.state < 3
    end
  end
  
  class ConcreteObserverB < Observer
    # @param [Subject] subject
    def update(subject)
      return unless subject.state.zero? || subject.state >= 2
  
      puts 'ConcreteObserverB: Reacted to the event'
    end
  end
  
  # Клиентский код.
  
  subject = ConcreteSubject.new
  
  observer_a = ConcreteObserverA.new
  subject.attach(observer_a)
  
  observer_b = ConcreteObserverB.new
  subject.attach(observer_b)
  
  subject.some_business_logic
  subject.some_business_logic
  
  subject.detach(observer_a)
  
  subject.some_business_logic











  # Класс Создатель объявляет фабричный метод, который должен возвращать объект
# класса Продукт. Подклассы Создателя обычно предоставляют реализацию этого
# метода.
#
# @abstract
class Creator
    # Обратите внимание, что Создатель может также обеспечить реализацию
    # фабричного метода по умолчанию.
    #
    # @abstract
    def factory_method
      raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
    end
  
    # Также заметьте, что, несмотря на название, основная обязанность Создателя не
    # заключается в создании продуктов. Обычно он содержит некоторую базовую
    # бизнес-логику, которая основана на объектах Продуктов, возвращаемых
    # фабричным методом. Подклассы могут косвенно изменять эту бизнес-логику,
    # переопределяя фабричный метод и возвращая из него другой тип продукта.
    #
    # @return [String]
    def some_operation
      # Вызываем фабричный метод, чтобы получить объект-продукт.
      product = factory_method
  
      # Далее, работаем с этим продуктом.
      result = "Creator: The same creator's code has just worked with #{product.operation}"
  
      result
    end
  end
  
  # Конкретные Создатели переопределяют фабричный метод для того, чтобы изменить
  # тип результирующего продукта.
  class ConcreteCreator1 < Creator
    # Обратите внимание, что сигнатура метода по-прежнему использует тип
    # абстрактного продукта, хотя фактически из метода возвращается конкретный
    # продукт. Таким образом, Создатель может оставаться независимым от конкретных
    # классов продуктов.
    #
    # @return [ConcreteProduct1]
    def factory_method
      ConcreteProduct1.new
    end
  end
  
  class ConcreteCreator2 < Creator
    # @return [ConcreteProduct2]
    def factory_method
      ConcreteProduct2.new
    end
  end
  
  # Интерфейс Продукта объявляет операции, которые должны выполнять все конкретные
  # продукты.
  #
  # @abstract
  class Product
    # return [String]
    def operation
      raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
    end
  end
  
  # Конкретные Продукты предоставляют различные реализации интерфейса Продукта.
  class ConcreteProduct1 < Product
    # @return [String]
    def operation
      '{Result of the ConcreteProduct1}'
    end
  end
  
  class ConcreteProduct2 < Product
    # @return [String]
    def operation
      '{Result of the ConcreteProduct2}'
    end
  end
  
  # Клиентский код работает с экземпляром конкретного создателя, хотя и через его
  # базовый интерфейс. Пока клиент продолжает работать с создателем через базовый
  # интерфейс, вы можете передать ему любой подкласс создателя.
  #
  # @param [Creator] creator
  def client_code(creator)
    print "Client: I'm not aware of the creator's class, but it still works.\n"\
          "#{creator.some_operation}"
  end
  
  puts 'App: Launched with the ConcreteCreator1.'
  client_code(ConcreteCreator1.new)
  puts "\n\n"
  
  puts 'App: Launched with the ConcreteCreator2.'
  client_code(ConcreteCreator2.new)