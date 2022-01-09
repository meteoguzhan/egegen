## How to install ?

Firstly, you need to clone git repo. (Run it in your terminal)

<code>git clone https://github.com/meteoguzhan/egegen.git </code>

After clone project, you need to install packages. (Make sure your system exists composer)

<code>cd egegen && composer install </code>

You need to copy env file and rename it as .env

<code>cp env .env</code>

Open .env file from root.
<pre>
# CI_ENVIRONMENT = production

// Do it to

CI_ENVIRONMENT = development
</pre>
Give your updated details of database connection string.
<pre>
#--------------------------------------------------------------------
# DATABASE
#--------------------------------------------------------------------

database.default.hostname = localhost
database.default.database = egegen
database.default.username = root
database.default.password = root
database.default.DBDriver = MySQLi
database.default.DBPrefix =
</pre>
