# OCF (Orthodox Canonical Form)

This bash script is a simple tool that helps you create `hpp` and `cpp` files filled with templates for the class.

## Usage

To create a single class, run the following:

```bash
bash ocf.sh bureaucrat
```

You can also create multiple classes at once like so:

```bash
bash ocf.sh bureaucrat form inter
```

## Example with output

Running the following command: 

```bash
bash ocf.sh bureaucrat
```

... will output these two files:

```bash
Bureaucrat.hpp
Bureaucrat.cpp
```

Content of `Bureaucrat.hpp` will be:

```cpp
#ifndef BUREAUCRAT_HPP
# define BUREAUCRAT_HPP
# include <iostream>

class Bureaucrat
{
	public:
		Bureaucrat(void);
		Bureaucrat(const Bureaucrat& other);
		Bureaucrat &operator=(const Bureaucrat &other);
		~Bureaucrat();
};

#endif // ifndef BUREAUCRAT_HPP

```

Content of `Bureaucrat.cpp` will be:

```cpp
#include "Bureaucrat.hpp"

// Default constructor
Bureaucrat::Bureaucrat(void)
{
	std::cout << "Default constructor called" << std::endl;
	return ;
}

// Copy constructor
Bureaucrat::Bureaucrat(const Bureaucrat &other)
{
	std::cout << "Copy constructor called" << std::endl;
	return ;
}

// Assignement operator overload
Bureaucrat &Bureaucrat::operator=(const Bureaucrat &other)
{
	std::cout << "Assignment operator called" << std::endl;
	return (*this);
}

// Destructor
Bureaucrat::~Bureaucrat(void)
{
	std::cout << "Desctructor called" << std::endl;
	return ;
}

```

## Configurations 

There is a simple *configuration* that you can do, you can easily change the output directory of the `hpp` and `cpp` files.

To do that, simply modify one or both of these lines to be the path where you want the files to be created:

```bash
hppPath="./"
cppPath="./"
```

> Note that the path has to end with a `/` character, otherwise the names of the files will be composed of the last part of the path + the class name
