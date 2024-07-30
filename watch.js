const chokidar = require('chokidar');
const { exec } = require('child_process');

const pathsToWatch = [
  'styles/**/*.less',
  'lib/pkp/styles/**/*.less',
  'plugins/themes/default/styles/**/*.less',
];

const watcher = chokidar.watch(pathsToWatch, {
  persistent: true,
  ignoreInitial: true,
});

const compileLess = () => {
  exec(
    'lessc styles/index.less public/journals/1/styleSheet.css',
    (err, stdout, stderr) => {
      if (err) {
        console.error(`Error: ${stderr}`);
      } else {
        console.log(`Compiled successfully: ${stdout}`);
      }
    }
  );
};

watcher
  .on('change', compileLess)
  .on('add', compileLess)
  .on('unlink', compileLess);

console.log('Watching for changes...');
