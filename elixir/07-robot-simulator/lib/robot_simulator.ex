defmodule RobotSimulator do
  @compass [:north, :east, :south, :west]
  @doc """
  Create a Robot Simulator given an initial direction and position.

  Valid directions are: `:north`, `:east`, `:south`, `:west`
  """
  def create(direction \\ :north, position \\ {0, 0})
  def create(direction, position = {x, y})
    when is_integer(x) and is_integer(y) and direction in @compass
    do
    %{position: position, direction: direction}
  end
  def create(_, {x, y})
    when is_integer(x) and is_integer(y) do
    {:error, "invalid direction"}
  end
  def create(_, _) do
    {:error, "invalid position"}
  end

  def direction(robot), do: robot.direction
  def position(robot), do: robot.position

  def simulate(robot, ""), do: robot
  def simulate(robot, <<head::utf8, tail::binary>>)
    when head in [?A,?L,?R]
    do
    robot = move(head, robot)
    simulate(robot, tail)
  end
  def simulate(_, _), do: {:error, "invalid instruction"}

  def move( ?A, %{ position: {x, y}, direction: :north  } ), do: %{ position: {x, y+1}, direction: :north }
  def move( ?A, %{ position: {x, y}, direction: :south  } ), do: %{ position: {x, y-1}, direction: :south }
  def move( ?A, %{ position: {x, y}, direction: :west  } ), do: %{ position: {x-1, y}, direction: :west }
  def move( ?A, %{ position: {x, y}, direction: :east  } ), do: %{ position: {x+1, y}, direction: :east }

  #     N
  #   E   W
  #     S

  def move( ?R, robot ), do: turn(1, robot)
  def move( ?L, robot ), do: turn(-1, robot)

  # def move( ?R, %{ position: position, direction: :north  } ), do: %{ position: position, direction: :east }
  # def move( ?R, %{ position: position, direction: :east  } ), do: %{ position: position, direction: :south }
  # def move( ?R, %{ position: position, direction: :south  } ), do: %{ position: position, direction: :west }
  # def move( ?R, %{ position: position, direction: :west  } ), do: %{ position: position, direction: :north }

  # def move( ?L, %{ position: position, direction: :north  } ), do: %{ position: position, direction: :west }
  # def move( ?L, %{ position: position, direction: :west  } ), do: %{ position: position, direction: :south }
  # def move( ?L, %{ position: position, direction: :south  } ), do: %{ position: position, direction: :east }
  # def move( ?L, %{ position: position, direction: :east  } ), do: %{ position: position, direction: :north }

  def turn( incrementor, %{ position: position, direction: direction  } ) do
    index = Enum.find_index(@compass, fn x -> x == direction end )
    remainder = rem(index+incrementor, 4)
    new_direction = Enum.at(@compass,remainder)
    %{ position: position, direction: new_direction }
  end
end
