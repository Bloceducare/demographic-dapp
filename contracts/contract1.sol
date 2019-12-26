pragma solidity >=0.5.0 <0.7.0;

contract PersonData {

    string _nationality = "Nigeria";
    uint personCounter;

    struct Person {
        string fullName;
        string residentialAddress;
        string sex;
        uint age;
        uint weight;
        uint height;
        string eyeColor;
        string hairColor;
        string complexion;
        string maritalStatus;
        string educationalLevel;
        string occupation;
        string placeOfBirth;
        string nationality;
    }

    mapping(address => Person) public persons;

    event NewPersonDataAdded( 
        string fullName,
        string residentialAddress,
        string sex,
        uint age,
        uint weight,
        uint height,
        string eyeColor,
        string hairColor,
        string complexion,
        string maritalStatus,
        string educationalLevel,
        string occupation,
        string placeOfBirth,
        string nationality
    );

    modifier checkNationality(string memory nationality) {
        require(keccak256(abi.encodePacked(nationality)) == keccak256(abi.encodePacked(_nationality)),
           "Person must be of Nigerian decent");
        _;
    }

    function AddPerson(
        string memory fullName,
        string memory residentialAddress,
        string memory sex,
        uint age,
        uint weight,
        uint height,
        string memory eyeColor,
        string memory hairColor,
        string memory complexion,
        string memory maritalStatus,
        string memory educationalLevel,
        string memory occupation,
        string memory placeOfBirth,
        string memory nationality
    )
        public
        checkNationality(nationality)
        returns (bool)
    {
        personCounter = personCounter + 1;
        Person memory person; //Person struct gives inbuilt method which is called person
        person.fullName = fullName;
        person.residentialAddress = residentialAddress;
        person.sex = sex;
        person.eyeColor = eyeColor;
        person.hairColor = hairColor;
        person.complexion = complexion;
        person.maritalStatus = maritalStatus;
        person.educationalLevel = educationalLevel;
        person.occupation = occupation;
        person.placeOfBirth = placeOfBirth;
        person.nationality = nationality;
        persons[msg.sender] = person;
        emit NewPersonDataAdded(
            fullName,
            residentialAddress,
            sex,
            age,
            weight,
            height,
            eyeColor,
            hairColor,
            complexion,
            maritalStatus,
            educationalLevel,
            occupation,
            placeOfBirth,
            nationality
        );
        return true;
    }

    function getPerson(address _personToGet) public view returns (
        string memory fullName,
        string memory residentialAddress,
        string memory sex,
        uint age,
        uint weight,
        uint height,
        string memory eyeColor,
        string memory hairColor,
        string memory complexion,
        string memory maritalStatus,
        string memory educationalLevel,
        string memory occupation,
        string memory placeOfBirth,
        string memory nationality
    ) {
        fullName = persons[_personToGet].fullName;
        residentialAddress = persons[_personToGet].residentialAddress;
        sex = persons[_personToGet].sex;
        age = persons[_personToGet].age;
        weight = persons[_personToGet].weight;
        height = persons[_personToGet].height;
        eyeColor = persons[_personToGet].eyeColor;
        hairColor = persons[_personToGet].hairColor;
        complexion = persons[_personToGet].complexion;
        maritalStatus = persons[_personToGet].maritalStatus;
        educationalLevel = persons[_personToGet].educationalLevel;
        occupation = persons[_personToGet].occupation;
        placeOfBirth = persons[_personToGet].placeOfBirth;
        nationality = persons[_personToGet].nationality;
    }
}