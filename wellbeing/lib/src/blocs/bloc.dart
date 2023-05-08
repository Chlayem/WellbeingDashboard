import 'dart:async';
import 'package:rxdart/rxdart.dart';
import 'package:wellbeing/src/elements/consultation.dart';
import 'package:wellbeing/src/elements/employee.dart';

import '../elements/chart_data.dart';
import '../elements/department.dart';
import '../elements/incident.dart';
import '../elements/period.dart';

class Bloc extends Object {
  List<Period> pers = [
    Period(month: 'Janvier', departments: [
      Department(
          stress: {"Flutter": 12},
          anxiety: {"anxiety": 25},
          fatigue: {"fatigue": 5},
          name: 'Production'),
      Department(
          stress: {"Flutter": 20},
          anxiety: {"anxiety": 18},
          fatigue: {"fatigue": 30},
          name: 'Finance'),
      Department(
          stress: {"Flutter": 17},
          anxiety: {"anxiety": 2},
          fatigue: {"fatigue": 19},
          name: 'Marketing')
    ], incidents: [
      Incident("faible", 20),
      Incident("Moyen", 40),
      Incident("Severe", 9),
      Incident("Critique", 1)
    ], daysOff: [
      Incident("Santé", 8),
      Incident("Emotionelle", 2),
      Incident("Incidents", 12)
    ]),
    Period(month: 'Février', departments: [
      Department(
          stress: {"Flutter": 11},
          anxiety: {"anxiety": 28},
          fatigue: {"fatigue": 16},
          name: 'Production'),
      Department(
          stress: {"Flutter": 8},
          anxiety: {"anxiety": 18},
          fatigue: {"fatigue": 12},
          name: 'Finance'),
      Department(
          stress: {"Flutter": 17},
          anxiety: {"anxiety": 17},
          fatigue: {"fatigue": 19},
          name: 'Marketing')
    ], incidents: [
      Incident("faible", 5),
      Incident("Moyen", 20),
      Incident("Severe", 1),
      Incident("Critique", 2)
    ], daysOff: [
      Incident("Santé", 11),
      Incident("Emotionelle", 12),
      Incident("Incidents", 30)
    ]),
    Period(month: 'Mars', departments: [
      Department(
          stress: {"Flutter": 75},
          anxiety: {"anxiety": 15},
          fatigue: {"fatigue": 10},
          name: 'Production'),
      Department(
          stress: {"Flutter": 4},
          anxiety: {"anxiety": 18},
          fatigue: {"fatigue": 2},
          name: 'Finance'),
      Department(
          stress: {"Flutter": 7},
          anxiety: {"anxiety": 20},
          fatigue: {"fatigue": 9},
          name: 'Marketing')
    ], incidents: [
      Incident("faible", 10),
      Incident("Moyen", 20),
      Incident("Severe", 15),
      Incident("Critique", 2)
    ], daysOff: [
      Incident("Santé", 10),
      Incident("Emotionelle", 20),
      Incident("Incidents", 12)
    ]),
  ];

  List<Consultation> currentCsl = [/*Consultation(date:DateTime(2020,5,9),bilan: "Lorem ")*/];//[Consultation(date:DateTime(2020,5,9),bilan: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."),Consultation(date: DateTime(2021,9,18),bilan: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."),Consultation(date: DateTime(2022,8,26),bilan: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.")];
  //List<bool> currentExpand = [false,false,false];
  int currentIndex = 0;
  Employee currentEmployee = Employee();
  List<Employee> currentList=[
    Employee(firstName: "Jhon",lastName:"Rodriguez",department: "Marketing",stress:[
      ChartData(month: "Jan", value: 2),
      ChartData(month: "Feb", value: 1),
      ChartData(month: "Mar", value: 1),
      ChartData(month: "Apr", value: 0),
      ChartData(month: "May", value: 2),
      ChartData(month: "Jun", value: 1),
      ChartData(month: "Jul", value: 0),
      ChartData(month: "Aug", value: 0),
      ChartData(month: "Sep", value: 0),
      ChartData(month: "Oct", value: 0),
      ChartData(month: "Nov", value: 0),
      ChartData(month: "Dec", value: 0),
    ],anxiety: [
      ChartData(month: "Jan", value: 0),
      ChartData(month: "Feb", value: 1),
      ChartData(month: "Mar", value: 1),
      ChartData(month: "Apr", value: 0),
      ChartData(month: "May", value: 2),
      ChartData(month: "Jun", value: 2),
      ChartData(month: "Jul", value: 2),
      ChartData(month: "Aug", value: 1),
      ChartData(month: "Sep", value: 2),
      ChartData(month: "Oct", value: 2),
      ChartData(month: "Nov", value: 0),
      ChartData(month: "Dec", value: 0),
    ],fatigue: [
      ChartData(month: "Jan", value: 2),
      ChartData(month: "Feb", value: 1),
      ChartData(month: "Mar", value: 1),
      ChartData(month: "Apr", value: 0),
      ChartData(month: "May", value: 2),
      ChartData(month: "Jun", value: 1),
      ChartData(month: "Jul", value: 0),
      ChartData(month: "Aug", value: 1),
      ChartData(month: "Sep", value: 2),
      ChartData(month: "Oct", value: 2),
      ChartData(month: "Nov", value: 0),
      ChartData(month: "Dec", value: 0),
    ],email: "jhon.james@gmail.com",job: "Manager",workHours:36,birthDate: DateTime(1980,5,20),recDate: DateTime(2019,2,23),num: 28664020),
    Employee(firstName: "Kevin",lastName:"Rodriguez",department: "Production",/*stress: 0,anxiety: 0,fatigue: 1,*/email: "kevin.james@gmail.com",job: "Manager",workHours:36,birthDate: DateTime(1980,5,20),recDate: DateTime(2019,2,23),num: 25668744),
    Employee(firstName: "Emma",lastName:"Rodriguez",department: "Marketing",/*stress: 1,anxiety: 0,fatigue: 2,*/email: "emma.james@gmail.com",job: "Developer",workHours:36,birthDate: DateTime(1980,5,20),recDate: DateTime(2019,2,23),num: 55870099),
    Employee(firstName: "James",lastName:"Rodriguez",department: "Finance",/*stress: 1,anxiety: 0,fatigue: 2,*/email: "james.james@gmail.com",job: "Engineer",workHours:36,birthDate: DateTime(1980,5,20),recDate: DateTime(2019,2,23),num: 92050886),
    Employee(firstName: "Fred",lastName:"Rodriguez",department: "Finance",/*stress: 1,anxiety: 0,fatigue: 2,*/email: "fred.james@gmail.com",job: "Developer",workHours:36,birthDate: DateTime(1980,5,20),recDate: DateTime(2019,2,23),num: 99885020),
    Employee(firstName: "Selena",lastName:"Rodriguez",department: "Marketing",/*stress: 1,anxiety: 0,fatigue: 2,*/email: "selena.james@gmail.com",job: "Manager",workHours:36,birthDate: DateTime(1980,5,20),recDate: DateTime(2019,2,23),num: 21741133),
    Employee(firstName: "Adam",lastName:"Rodriguez",department: "Marketing",/*stress: 1,anxiety: 0,fatigue: 2,*/email: "adam.james@gmail.com",job: "Manager",workHours:36,birthDate: DateTime(1980,5,20),recDate: DateTime(2019,2,23),num: 52114189),
  ] ;
  Period currentPeriod = Period(month:'Mars',departments: [],daysOff: [],incidents: []);


  final _cslController = BehaviorSubject<List<Consultation>>.seeded([]);//[Consultation(date:DateTime(2020,5,9),bilan: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."),Consultation(date: DateTime(2021,9,18),bilan: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."),Consultation(date: DateTime(2022,8,26),bilan: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.")]);
  //final _expandedController = BehaviorSubject<List<bool>>.seeded([]);
  final _screenController = BehaviorSubject<int>.seeded(0);
  final _employeeController = BehaviorSubject<Employee>.seeded(Employee());
  final _listController = BehaviorSubject<List<Employee>>.seeded([
    Employee(firstName: "Jhon",lastName:"Rodriguez",department: "Marketing",stress:[
      ChartData(month: "Jan", value: 2),
      ChartData(month: "Feb", value: 1),
      ChartData(month: "Mar", value: 1),
      ChartData(month: "Apr", value: 0),
      ChartData(month: "May", value: 2),
      ChartData(month: "Jun", value: 1),
      ChartData(month: "Jul", value: 0),
      ChartData(month: "Aug", value: 0),
      ChartData(month: "Sep", value: 0),
      ChartData(month: "Oct", value: 0),
      ChartData(month: "Nov", value: 0),
      ChartData(month: "Dec", value: 0),
    ],anxiety: [
      ChartData(month: "Jan", value: 0),
      ChartData(month: "Feb", value: 1),
      ChartData(month: "Mar", value: 1),
      ChartData(month: "Apr", value: 0),
      ChartData(month: "May", value: 2),
      ChartData(month: "Jun", value: 2),
      ChartData(month: "Jul", value: 2),
      ChartData(month: "Aug", value: 1),
      ChartData(month: "Sep", value: 2),
      ChartData(month: "Oct", value: 2),
      ChartData(month: "Nov", value: 0),
      ChartData(month: "Dec", value: 0),
    ],fatigue: [
      ChartData(month: "Jan", value: 2),
      ChartData(month: "Feb", value: 1),
      ChartData(month: "Mar", value: 1),
      ChartData(month: "Apr", value: 0),
      ChartData(month: "May", value: 2),
      ChartData(month: "Jun", value: 1),
      ChartData(month: "Jul", value: 0),
      ChartData(month: "Aug", value: 1),
      ChartData(month: "Sep", value: 2),
      ChartData(month: "Oct", value: 2),
      ChartData(month: "Nov", value: 0),
      ChartData(month: "Dec", value: 0),
    ],email: "jhon.james@gmail.com",job: "Manager",workHours:36,birthDate: DateTime(1980,5,20),recDate: DateTime(2019,2,23),num: 28664020),
    Employee(firstName: "Kevin",lastName:"Rodriguez",department: "Production",/*stress: 0,anxiety: 0,fatigue: 1,*/email: "kevin.james@gmail.com",job: "Manager",workHours:36,birthDate: DateTime(1980,5,20),recDate: DateTime(2019,2,23),num: 25668744),
    Employee(firstName: "Emma",lastName:"Rodriguez",department: "Marketing",/*stress: 1,anxiety: 0,fatigue: 2,*/email: "emma.james@gmail.com",job: "Developer",workHours:36,birthDate: DateTime(1980,5,20),recDate: DateTime(2019,2,23),num: 55870099),
    Employee(firstName: "James",lastName:"Rodriguez",department: "Finance",/*stress: 1,anxiety: 0,fatigue: 2,*/email: "james.james@gmail.com",job: "Engineer",workHours:36,birthDate: DateTime(1980,5,20),recDate: DateTime(2019,2,23),num: 92050886),
    Employee(firstName: "Fred",lastName:"Rodriguez",department: "Finance",/*stress: 1,anxiety: 0,fatigue: 2,*/email: "fred.james@gmail.com",job: "Developer",workHours:36,birthDate: DateTime(1980,5,20),recDate: DateTime(2019,2,23),num: 99885020),
    Employee(firstName: "Selena",lastName:"Rodriguez",department: "Marketing",/*stress: 1,anxiety: 0,fatigue: 2,*/email: "selena.james@gmail.com",job: "Manager",workHours:36,birthDate: DateTime(1980,5,20),recDate: DateTime(2019,2,23),num: 21741133),
    Employee(firstName: "Adam",lastName:"Rodriguez",department: "Marketing",/*stress: 1,anxiety: 0,fatigue: 2,*/email: "adam.james@gmail.com",job: "Manager",workHours:36,birthDate: DateTime(1980,5,20),recDate: DateTime(2019,2,23),num: 52114189),
  ]);
  final _periodController = BehaviorSubject<Period>.seeded(Period(month:'Mars',departments: [
    Department(stress: {"Flutter": 75}, anxiety: {"anxiety":15}, fatigue: {"fatigue":10}, name: 'Production'),
    Department(stress: {"Flutter": 4}, anxiety: {"anxiety":18}, fatigue: {"fatigue":2},name: 'Finance'),
    Department(stress: {"Flutter": 7}, anxiety: {"anxiety":20}, fatigue: {"fatigue":9},name:'Marketing')
  ], incidents: [
    Incident("faible", 10),
    Incident("Moyen", 20),
    Incident("Severe", 15),
    Incident("Critique", 2)
  ], daysOff: [
    Incident("Santé", 10),
    Incident("Emotionelle", 20),
    Incident("Incidents", 12)
  ]));


  //Stream<List<bool>> get expandeds => _expandedController.stream;
  Stream<int> get screens => _screenController.stream;
  Stream<Employee> get employees => _employeeController.stream;
  Stream<List<Employee>> get lists => _listController.stream;
  Stream<Period> get periods => _periodController.stream;
  Stream<List<Consultation>> get consultations => _cslController.stream;

  void navigateToScreen(int index,) {
    currentIndex = index;
    _screenController.sink.add(currentIndex);
  }
  void pushEmployee(Employee e){
    currentList.add(e);
    _listController.sink.add(currentList);
  }
  void popEmployee(Employee e){
    currentList.remove(e);
    _listController.sink.add(currentList);
  }
  void selectEmployee(Employee employee,) {
    currentEmployee = employee;
    _employeeController.sink.add(currentEmployee);
  }
  void pushList(List<Employee> empList,) {
    currentList = empList;
    for (Employee e in currentList){
      if(e.csl == null) continue;
      for(Consultation c in e.csl!){
        c.isExpanded =false;
      }
    }
    _listController.sink.add(currentList);
  }
  void pushPeriod(String period,) {
    for (Period p in pers){
      if (p.month == period)currentPeriod=p;
    }
    _periodController.sink.add(currentPeriod);
  }
  /*void pushExpand(List<bool> expanded){
    currentExpand =expanded;
    _expandedController.sink.add(currentExpand);
  }*/
  void addCsl(Consultation c){
    currentCsl.add(c);
    _cslController.add(currentCsl);
    currentEmployee.csl=currentCsl;
  }

  void pushCsl(List<Consultation> csl){
    currentCsl = csl;
    _cslController.sink.add(currentCsl);
  }


  List<String> years = ['Fiscal Year','2019-20', '2020-21', '2021-22' ,'2022-23'];
  List<String> months = ['Start Month','   Janvier', '   Février', '   Mars', '   Avril', '   Mai', '   Juin', '   Juillet', '   Août', '   Septembre', '   Octobre', '   Novembre', '   Décembre'];

  final _selectedYear = BehaviorSubject<String>.seeded('Fiscal Year');
  final _selectedMonth = BehaviorSubject<String>.seeded('Start Month');

  Stream<String> get selectedYear => _selectedYear.stream;
  Stream<String> get selectedMonth => _selectedMonth.stream;

  void selectYear(String? newYear) {
    if (newYear != null) {
      _selectedYear.sink.add(newYear);
    }
  }

  void selectMonth(String? newMonth) {
    if (newMonth != null) {
      _selectedMonth.sink.add(newMonth);
    }
  }
  void dispose() {
    _screenController.close();
    _employeeController.close();
    _listController.close();
    _periodController.close();
    _cslController.close();
  }
}





