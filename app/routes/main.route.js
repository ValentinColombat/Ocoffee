import { Router } from 'express';
import mainController from '../controllers/main.controller.js';

const mainRouter = Router ();

mainRouter.get ('/', mainController.homepage)
mainRouter.get ('/catalogue', mainController.catalog)
mainRouter.get ('/cafe/:reference', mainController.product)

export default mainRouter;