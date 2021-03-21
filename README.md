## Postgres

### Prerequisites:

[Docker Desktop](https://hub.docker.com/editions/community/docker-ce-desktop-windows)

OR

[Postgres](https://www.postgresql.org/download/)


### Loose Agenda:

Create a Postgres server 
Create a Postgres database
Insert, Update, Read and Delete data


### Step by Step

#### Obtain a Postgres Server Without Docker

Run the Postgres install

Accept the defaults of the install and provide a password such as ```notdocker```

Note - if you change any of the defaults then pay attention to substitute those values later.


#### Obtain a Postgres Server With Docker

Pull and run the postgres docker image

```
docker pull postgres:11
docker run -d --rm -p 5432:5432 -e POSTGRES_PASSWORD=docker -e POSTGRES_USER=postgres postgres:11
```


Pull and run the pgAdmin docker image
```
docker pull dpage/pgadmin4:5
docker run -p 81:80 -e 'PGADMIN_DEFAULT_EMAIL=user@domain.com' -e 'PGADMIN_DEFAULT_PASSWORD=docker' -d dpage/pgadmin4:5
```

Open a browser to http://localhost:81

With PgAdmin open in your preferred browser, log in with the credentials specified above.

In the browser window, right click the Server node and click ```Create > Server```

Enter a name for the server in the General tab then navigate to the Connection tab.

Enter ```host.docker.internal``` for the Host name/address

Enter the username ```postgres``` and the password ```docker``` then click Save


#### Create a Database

First let's create a database.

In PgAdmin you can right-click the databases node in the Browser window and click ```Create > Database```

Let's name the database ```nonzerodatabase```

Note that you can now right click the database and click ```CREATE Script``` to obtain a SQL script to generate this database. 

Let's now right-click the database and click ```Query Tool```

Enter the following script in the Query Tool window and click the Execute button (or hit F5 with the window selected.)

```

CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

CREATE TABLE IF NOT EXISTS nonzerotable (
   id uuid PRIMARY KEY DEFAULT uuid_generate_v4(),
   name TEXT NOT NULL,
   age INT NOT NULL,
   address CHAR(50)
);
```


#### Manipulate Data

Now that we have a database and table, let's manipulate some data.

Let's start by verifying there's nothing in the table. In the Query Tool enter and run the following script.

```
SELECT * FROM nonzerotable;
```

Note that there is no data in the result. Let's add some with the following script.

```
INSERT INTO nonzerotable (name, age, address) VALUES(
	'Joe',
	30,
	'home'
);

SELECT * FROM nonzerotable;
```

Note that this time there was a result. Also note that the id field was automatically generated.

Let's change the age on our entry. Copy the id from the row in Data Output and use it to complete the following script. 

```
UPDATE nonzerotable 
SET age=31
WHERE id='REPLACE-THIS-WITH-YOUR-ID';

SELECT * FROM nonzerotable;
```

Note that the age has changed.

Finally, let's delete our entry with the following script.

```
DELETE FROM nonzerotable
WHERE id='REPLACE-THIS-WITH-YOUR-ID' ;

SELECT * FROM nonzerotable;
```

### Additional Reading

- [PostgreSQL Commands](https://www.postgresql.org/docs/10/sql-commands.html)
- [PostgreSQL About Page](https://www.postgresql.org/about/)

Postgres is a simple, cheap data storage technology which makes it a great choice for initial learning ventures into current data storage practices but there are also many other technologies you can choose. If you're intrigued then feel free to check out alternatives such as MySQL, Redis, or MongoDB.

Congratulations on a non-zero day!
