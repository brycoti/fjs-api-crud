// Define the sequelize setup
const Sequelize = require('sequelize');
const sequelize = new Sequelize('regira', 'root', 'admin', {
  host: 'localhost',
  dialect: 'mysql' // or any other dialect
});

// Define the Project model
const Project = sequelize.define('project', {
  name: {
    type: Sequelize.STRING,
    allowNull: false
  },
  desc: {
    type: Sequelize.STRING,
    allowNull: false
  },
  active: {
    type: Sequelize.BOOLEAN,
    defaultValue: true
  }
});

// Define the Issue model
const Issue = sequelize.define('issue', {
  title: {
    type: Sequelize.STRING,
    allowNull: false
  },
  desc: {
    type: Sequelize.STRING,
    allowNull: false
  },
  issue_type: {
    type: Sequelize.ENUM('Bug', 'Feature', 'Task'),
    allowNull: false
  },
  priority: {
    type: Sequelize.ENUM('Low', 'Medium', 'High'),
    allowNull: false
  },
  state: {
    type: Sequelize.ENUM('Open', 'In Progress', 'Resolved', 'Closed'),
    allowNull: false
  }
});

// Define the Tag model
const Tag = sequelize.define('tag', {
  name: {
    type: Sequelize.STRING,
    unique: true,
    allowNull: false
  }
});

// Define the User model
const User = sequelize.define('user', {
  name: {
    type: Sequelize.STRING,
    allowNull: false
  },
  email: {
    type: Sequelize.STRING,
    allowNull: false
  }
});

// Define the Comment model
const Comment = sequelize.define('comment', {
  title: {
    type: Sequelize.STRING,
    allowNull: false
  },
  text: {
    type: Sequelize.STRING,
    allowNull: false
  }
});

// Define associations
Project.hasMany(Issue); // One project can have multiple issues
Issue.belongsTo(Project); // An issue belongs to one project

Issue.belongsToMany(Tag, { through: 'IssueTag' }); // Many-to-many relationship between Issue and Tag
Tag.belongsToMany(Issue, { through: 'IssueTag' }); // Many-to-many relationship between Tag and Issue

User.hasMany(Comment); // One user can have multiple comments
Comment.belongsTo(User); // A comment belongs to one user
Issue.hasMany(Comment); // One issue can have multiple comments
Comment.belongsTo(Issue); // A comment belongs to one issue

// Sync models with the database
/*
sequelize.sync({ force: true }) // This will drop the tables if they already exist
  .then(() => {
    console.log('Database & tables created!');
  });
  */

// Export models
module.exports = {
  Project,
  Issue,
  Tag,
  User,
  Comment
};
