import * as http from 'http';
import postgraphile from 'postgraphile';

import { env } from './env';

http
  .createServer(
    postgraphile(env.DATABASE_URL, 'public', {
      watchPg: true,
      graphiql: true,
      enhanceGraphiql: true
    })
  )
  .listen(env.GRAPHQL_PORT);
