import { Router } from 'express';
import mainController from '../controllers/main.controller.js';

const catalogRouter = Router();

catalogRouter.get('/', mainController.catalog);

export default catalogRouter;
