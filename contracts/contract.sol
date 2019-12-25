pragma solidity >=0.5.0 <0.6.0;
contract MeetPerson {
    uint maxNoOfPersons;
    uint personCounter;
    struct Person {
        string name;
        string profession;
        string hobby;
    }
    mapping(address => Person) public persons;
    event NewPersonJoined(string name, string profession, string hobby);
    modifier checkMax(uint noOfPersons) {
        require(noOfPersons <= maxNoOfPersons, "Max intake reached");
        _;
    }
    constructor(uint _maxNoOfPersons) public {
        maxNoOfPersons = _maxNoOfPersons;
    }
    function newPerson(string memory name, string memory profession, string memory hobby) public checkMax(personCounter) returns (bool) {
        personCounter = personCounter + 1;
        Person memory __additionalperson;
        __additionalperson.name = name;
        __additionalperson.profession = profession;
        __additionalperson.hobby = hobby;
        persons[msg.sender] = __additionalperson;
        emit NewPersonJoined(name, profession, hobby);
        return true;
    }
    function getPerson(address _personToGet) public view returns (string memory name, string memory profession, string memory hobby) {
          name = persons[_personToGet].name;
          profession = persons[_personToGet].profession;
          hobby = persons[_personToGet].hobby;
    }
}