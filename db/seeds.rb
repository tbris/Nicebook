User.create(name: "John Doe", email: "john@doe.com", password: "johndoe01")#, password_confirmation: "johndoe01")
User.create(name: "Jane Doe", email: "jane@doe.com", password: "janedoe01")#, password_confirmation: "janedoe01")
User.create(name: "Bob Rock", email: "bob@rock.com", password: "bobrock01")#, password_confirmation: "bobrock01")
User.create(name: "Tito Poo", email: "tito@poo.com", password: "titopoo01")#, password_confirmation: "titopoo01")
User.create(name: "Mama Mas", email: "mama@mas.com", password: "mamamas01")#, password_confirmation: "mamamas01")

User.first.posts.create(body: "Lorem Ipsum is simply dummy text of the printing and typesetting industry.")
User.first.posts.create(body: "Contrary to popular belief, Lorem Ipsum is not simply random text.")
User.second.posts.create(body: "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.")

Post.first.comments.create(author: User.first, body: "Hello world")
Post.first.comments.create(author: User.first, body: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.")
Post.first.comments.create(author: User.second, body: "Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.")
Post.first.comments.create(author: User.third, body: "Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit")
Post.first.comments.create(author: User.first, body: "sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt.")

Comment.first.comments.create(author: User.first, body: "first")
Comment.first.comments.create(author: User.first, body: "second")
Comment.first.comments.create(author: User.first, body: "third")
