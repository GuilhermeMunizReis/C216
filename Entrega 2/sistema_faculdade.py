# Guilherme Muniz de Oliveira Reis - GES - 127

from typing import List

class Aluno:
    current_id = 0
    
    def __init__(self, nome: str, email:str, curso: str):
        self.nome = nome
        self.email = email
        self.curso = curso
        
        self.matricula = f"{self.curso}{self._get_id()}"
        

    def _get_id(self) -> int:
        Aluno.current_id += 1
        return Aluno.current_id

class Crud:
    def __init__(self):
        self.alunos: List[Aluno] = []    
    
    def create_aluno(self):
        print("Criando aluno...")
        nome = input("Digite o nome: ")
        email = input("Digite o email: ")
        curso = input("Digite o curso: ")
        aluno = Aluno(nome, email, curso)
        self.alunos.append(aluno)
        print("Aluno criado com sucesso!")
        
    def read_aluno(self):
        matricula = input("Digite a matricula do aluno: ")
        
        for aluno in self.alunos:
            if aluno.matricula == matricula:
                print("Aluno encontrado:")
                print(f"Nome: {aluno.nome}")
                print(f"Email: {aluno.email}")
                print(f"Matricula: {aluno.matricula}")
                print(f"Curso: {aluno.curso}")
                return
        print("Aluno não encontrado!")

    def read_aluno_all(self):
        for aluno in self.alunos:
            print("Aluno encontrado:")
            print(f"Nome: {aluno.nome}")
            print(f"Email: {aluno.email}")
            print(f"Matricula: {aluno.matricula}")
            print(f"Curso: {aluno.curso}")

    def update_aluno(self):
        matricula = input("Digite a matricula do aluno: ")
        
        for aluno in self.alunos:
            if aluno.matricula == matricula:
                print("Aluno encontrado:")
                nome = input("Digite o nome: ")
                email = input("Digite o email: ")
                curso = input("Digite o curso: ")
                aluno.nome = nome
                aluno.email = email
                aluno.curso = curso
                print("Aluno atualizado com sucesso!")
                return
        print("Aluno não encontrado!")

    def delete_aluno(self):
        matricula = input("Digite a matricula do aluno: ")
        
        for aluno in self.alunos:
            if aluno.matricula == matricula:
                self.alunos.remove(aluno)
                print("Aluno deletado com sucesso!")
                return
        print("Aluno não encontrado!")
        
def main():
    crud = Crud()
    
    while True:
        print("\nMenu de Opções:")
        print("1. Cadastrar Aluno")
        print("2. Listar Aluno")
        print("3. Listar Todos Alunos")
        print("4. Atualizar Aluno")
        print("5. Remover Aluno")
        print("6. Sair")

        opcao = input("Escolha uma opção: ")

        if opcao == '1':
            crud.create_aluno()
        elif opcao == '2':
            crud.read_aluno()
        elif opcao == '3':
            crud.read_aluno_all()
        elif opcao == '4':
            crud.update_aluno()
        elif opcao == '5':
            crud.delete_aluno()
        elif opcao == '6':
            print("Saindo...")
            break
        else:
            print("Opção inválida! Tente novamente.")

if __name__ == "__main__":
    main()