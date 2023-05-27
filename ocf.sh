#! /bin/bash

hppPath="./"
cppPath="./"

mkdir -p $hppPath $cppPath

for class in "$@"
do
	hpp="$hppPath${class^}".hpp
	cpp="$cppPath${class^}".cpp
	# HPP
	rm -f $hpp && touch $hpp
	cat > $hpp << EOL
#ifndef ${class^^}_HPP
# define ${class^^}_HPP
# include <iostream>

class ${class^}
{
	public:
		${class^}(void);
		${class^}(const ${class^}& other);
		${class^} &operator=(const ${class^} &other);
		~${class^}();
};

#endif

EOL

	# CPP
	rm -f $cpp && touch $cpp
	cat > $cpp << EOL
#include "${class^}.hpp"

// Default constructor
${class^}::${class^}(void)
{
	std::cout << "Default constructor called" << std::endl;
	return ;
}

// Copy constructor
${class^}::${class^}(const ${class^} &other)
{
	std::cout << "Copy constructor called" << std::endl;
	return ;
}

// Assignment operator overload
${class^} &${class^}::operator=(const ${class^} &other)
{
	std::cout << "Assignment operator called" << std::endl;
	return (*this);
}

// Destructor
${class^}::~${class^}(void)
{
	std::cout << "Destructor called" << std::endl;
	return ;
}

EOL
done

printf "\n$# classes created:\n\n"
for class in "$@"
do
	echo "${class^}.hpp/.cpp"
done
echo "";