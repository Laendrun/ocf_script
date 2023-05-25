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
	printf "#ifndef ${class^^}_HPP\n# define ${class^^}_HPP\n" >> $hpp
	printf "# include <iostream>\n\n" >> $hpp

	printf "class ${class^}\n{\n\tpublic:\n" >> $hpp
	printf "\t\t${class^}(void);\n" >> $hpp
	printf "\t\t${class^}(const ${class^}& other);\n" >> $hpp
	printf "\t\t${class^} &operator=(const ${class^} &other);\n" >> $hpp
	printf "\t\t~${class^}();\n};\n" >> $hpp

	printf "\n#endif // ifndef ${class^^}_HPP\n" >> $hpp

	# CPP
	rm -f $cpp && touch $cpp
	printf "#include \"${class^}.hpp\"\n" >> $cpp
	printf "\n// Default constructor\n" >> $cpp
	printf "${class^}::${class^}(void)\n{\n" >> $cpp
	printf "\tstd::cout << \"Default constructor called\" << std::endl;\n" >> $cpp
	printf "\treturn ;\n}\n" >> $cpp

	printf "\n// Copy constructor\n" >> $cpp
	printf "${class^}::${class^}(const ${class^} &other)\n{\n" >> $cpp
	printf "\tstd::cout << \"Copy constructor called\" << std::endl;\n" >> $cpp
	printf "\treturn ;\n}\n" >> $cpp

	printf "\n// Assignement operator overload\n" >> $cpp
	printf "${class^} &${class^}::operator=(const ${class^} &other)\n{\n" >> $cpp
	printf "\tstd::cout << \"Assignment operator called\" << std::endl;\n" >> $cpp
	printf "\treturn (*this);\n}\n" >> $cpp

	printf "\n// Destructor\n" >> $cpp
	printf "${class^}::~${class^}(void)\n{\n" >> $cpp
	printf "\tstd::cout << \"Desctructor called\" << std::endl;\n" >> $cpp
	printf "\treturn ;\n}\n" >> $cpp
done

printf "\n$# classes created:\n\n"
for class in "$@"
do
	echo "${class^}.hpp/.cpp"
done
echo "";