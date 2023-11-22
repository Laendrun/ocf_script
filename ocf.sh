#!/bin/bash

hppPath="./"
cppPath="./"

mkdir -p $hppPath $cppPath

for class in "$@"
do
    capClass="$(tr '[:lower:]' '[:upper:]' <<< ${class:0:1})${class:1}"
    fcapClass="$(tr '[:lower:]' '[:upper:]' <<< ${class})"
    hpp="$hppPath$capClass".hpp
    cpp="$cppPath$capClass".cpp
    # HPP
    rm -f $hpp && touch $hpp
    cat > $hpp << EOL
#ifndef ${fcapClass}_HPP
# define ${fcapClass}_HPP
# include <iostream>

class $capClass
{
    public:
        $capClass(void);
        $capClass(const $capClass& other);
        $capClass &operator=(const $capClass &other);
        ~$capClass();
};

#endif

EOL

    # CPP
    rm -f $cpp && touch $cpp
    cat > $cpp << EOL
#include "$capClass.hpp"

// Default constructor
$capClass::$capClass(void)
{
    std::cout << "Default constructor called" << std::endl;
    return ;
}

// Copy constructor
$capClass::$capClass(const $capClass &other)
{
    std::cout << "Copy constructor called" << std::endl;
    (void) other;
    return ;
}

// Assignment operator overload
$capClass &$capClass::operator=(const $capClass &other)
{
    std::cout << "Assignment operator called" << std::endl;
    (void) other;
    return (*this);
}

// Destructor
$capClass::~$capClass(void)
{
    std::cout << "Destructor called" << std::endl;
    return ;
}

EOL
done

printf "\n$# classes created:\n\n"
for class in "$@"
do
    echo "$capClass.hpp/.cpp"
done