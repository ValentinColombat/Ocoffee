// agrége tous les autres routeurs 

import { Router } from 'express';
import mainRouter from './main.route.js';
import catalogueRouter from './catalog.route.js';

const router = Router();

router.use('/', mainRouter);
router.use('/catalogue', catalogueRouter);

export default router;