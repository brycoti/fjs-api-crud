const express = require('express');
const router = express.Router();
const { Project, Issue, Tag, User, Comment } = require('./models');
const {
  createItem,
  updateItem,
  deleteItem,
  readItem,
  readItems
} = require('./generics');



// CRUD operations for Project
router.post('/projects', async (req, res) => await createItem(req, res, Project));
router.get('/projects', async (req, res) => await readItems(req, res, Project));
router.get('/projects/:id', async (req, res) => await readItem(req, res, Project));
router.put('/projects/:id', async (req, res) => await updateItem(req, res, Project));
router.delete('/projects/:id', async (req, res) => await deleteItem(req, res, Project));


// CRUD operations for ISSUE
router.post('/issues', async (req, res) => await createItem(req, res, Issue));
router.get('/issues', async (req, res) => await readItems(req, res, Issue));
router.get('/issues/:id', async (req, res) => await readItem(req, res, Issue));
router.put('/issues/:id', async (req, res) => await updateItem(req, res, Issue));
router.delete('/issues/:id', async (req, res) => await deleteItem(req, res, Issue));


// CRUD operations for TAG
router.post('/tags', async (req, res) => await createItem(req, res, Tag));
router.get('/tags', async (req, res) => await readItems(req, res, Tag));
router.get('/tags/:id', async (req, res) => await readItem(req, res, Tag));
router.put('/tags/:id', async (req, res) => await updateItem(req, res, Tag));
router.delete('/tags/:id', async (req, res) => await deleteItem(req, res, Tag));

// CRUD operations for User
router.post('/users', async (req, res) => await createItem(req, res, User));
router.get('/users', async (req, res) => await readItems(req, res, User));
router.get('/users/:id', async (req, res) => await readItem(req, res, User));
router.put('/users/:id', async (req, res) => await updateItem(req, res, User));
router.delete('/users/:id', async (req, res) => await deleteItem(req, res, User));


// CRUD operations for Comment
router.post('/comments', async (req, res) => await createItem(req, res, Comment));
router.get('/comments', async (req, res) => await readItems(req, res, Comment));
router.get('/comments/:id', async (req, res) => await readItem(req, res, Comment));
router.put('/comments/:id', async (req, res) => await updateItem(req, res, Comment));
router.delete('/comments/:id', async (req, res) => await deleteItem(req, res, Comment));





// Endpoint to link a tag to an issue
router.post('/issues/:issueId/tags/:tagId', async (req, res) => {
  try {
    const issue = await Issue.findByPk(req.params.issueId);
    const tag = await Tag.findByPk(req.params.tagId);
    if (!issue || !tag) {
      return res.status(404).json({ error: 'Issue or Tag not found' });
    }
    await issue.addTag(tag);
    res.json({ message: 'Tag linked to issue successfully' });
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});

// Endpoint to create a comment linked to an issue and author
router.post('/issues/:issueId/comments/:userId', async (req, res) => {
  try {
    const issue = await Issue.findByPk(req.params.issueId);
    const user = await User.findByPk(req.params.userId);
    if (!issue || !user) {
      return res.status(404).json({ error: 'Issue or User not found' });
    }
    const comment = await Comment.create({ ...req.body, userId: req.params.userId, issueId: req.params.issueId });
    res.status(201).json(comment);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});

// Endpoint to get all tags for an issue
router.get('/issues/:issueId/tags', async (req, res) => {
  try {
    const issue = await Issue.findByPk(req.params.issueId);
    if (!issue) {
      return res.status(404).json({ error: 'Issue not found' });
    }
    const tags = await issue.getTags();
    res.json(tags);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});

// Endpoint to get all comments for an issue
router.get('/issues/:issueId/comments', async (req, res) => {
  try {
    const issue = await Issue.findByPk(req.params.issueId);
    if (!issue) {
      return res.status(404).json({ error: 'Issue not found' });
    }
    const comments = await Comment.findAll({ where: { issueId: req.params.issueId } });
    res.json(comments);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});

// Endpoint to get all comments for an author
router.get('/users/:userId/comments', async (req, res) => {
  try {
    const user = await User.findByPk(req.params.userId);
    if (!user) {
      return res.status(404).json({ error: 'User not found' });
    }
    const comments = await Comment.findAll({ where: { userId: req.params.userId } });
    res.json(comments);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});


// Endpoint to add an issue to a project
router.post('/projects/:projectId/issues', async (req, res) => {
  try {
    const project = await Project.findByPk(req.params.projectId);
    if (!project) {
      return res.status(404).json({ error: 'Project not found' });
    }
    const issue = await Issue.create({ ...req.body, projectId: req.params.projectId });
    res.status(201).json(issue);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});

// Endpoint to get the issues of a project
router.get('/projects/:projectId/issues', async (req, res) => {
  try {
    const project = await Project.findByPk(req.params.projectId, { include: Issue });
    if (!project) {
      return res.status(404).json({ error: 'Project not found' });
    }
    res.json(project.issues);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});

// Endpoint to get a list of projects and their related issues and statuses
router.get('/projects/issues/status', async (req, res) => {
  try {
    const projects = await Project.findAll({ include: Issue });
    const projectIssues = projects.map(project => {
      return {
        id: project.id,
        name: project.name,
        issues: project.issues.map(issue => {
          return {
            id: issue.id,
            title: issue.title,
            status: issue.state
          };
        })
      };
    });
    res.json(projectIssues);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});




module.exports = router;
