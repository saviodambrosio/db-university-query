-- Selezionare tutti gli studenti nati nel 1990 
SELECT * FROM students
WHERE year(date_of_birth) = '1990';

-- Selezionare tutti i corsi che valgono più di 10 crediti
select name , cfu 
from courses c 
where cfu >10;

-- Selezionare tutti gli studenti che hanno più di 30 anni
select name , date_of_birth 
from students s 
where TIMESTAMPDIFF(year,date_of_birth,curdate())>30;

-- Selezionare tutti i corsi di laurea magistrale
select *
from degrees d 
where level like 'magistrale';

-- Da quanti dipartimenti è composta l’università?
select count(id) 
from departments d;

-- Quanti sono gli insegnanti che non hanno un numero di telefono?
select count(id) 
from teachers t 
where phone is not null;

-- Contare quanti iscritti ci sono stati ogni anno
select enrolment_date , count(id) as numero_di_iscritti
from students s 
group by enrolment_date ;

-- Calcolare la media dei voti di ogni appello d’esame
select exam_id , avg(vote)
from exam_student es
group by exam_id ;

-- Contare quanti corsi di laurea ci sono per ogni dipartimento
select d2.name , count(department_id) 
from degrees d , departments d2 
where d.department_id = d2.id 
group by department_id;

-- Selezionare tutti gli studenti iscritti al Corso di Laurea in Economia
select s.name , s.surname , d.name , s.degree_id 
from students s ,degrees d 
where s.degree_id = d.id
having s.degree_id like '53';

-- Selezionare tutti i Corsi di Laurea Magistrale del Dipartimento di Neuroscienze
select department_id , name , level
from degrees 
where department_id like '7'and level like 'magistrale';

-- Selezionare tutti i corsi in cui insegna Fulvio Amato
select *
from course_teacher ct 
where teacher_id = 44;

-- Selezionare tutti gli studenti con i dati relativi al corso di laurea a cui sono iscritti e il relativo dipartimento, in ordine alfabetico per cognome e nome
select s.name, s.surname, d.name, dep.name
from departments dep
inner join degrees d
on dep.id = d.department_id
inner join students s 
on d.id = s.degree_id
order by s.surname, s.name asc;










