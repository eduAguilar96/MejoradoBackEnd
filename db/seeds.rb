# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

mate = Subject.create({
    text: "Matematicas"
})
examen = Exam.create({
    subject: mate,
    name: "Parcial Primer Parcial",
    institution: "Tecnologico de Montegey",
    professor: "Mejorado"
})
text_field_nombre = TextField.create({
    exam: examen,
    key: "Nombre :"
})
text_field_matricula = TextField.create({
    exam: examen,
    key: "Matricula :"
})

question = Question.create({
    subject: mate,
    tipo: 1,
    name: "Derivacion Basica 1",
    text: "Porfacor derive la siguiente ecuacion",
    equation: "1x + ($a)"
})

examen.questions << question

variable = Variable.create({
    question: question,
    tipo: 1,
    low_num: 1,
    high_den: 10
})

answer = Answer.create({
    question: question,
    correct: true,
    tipo: 1,
    text: "",
    equation: "$a - 2"
})

variable.answers << answer
